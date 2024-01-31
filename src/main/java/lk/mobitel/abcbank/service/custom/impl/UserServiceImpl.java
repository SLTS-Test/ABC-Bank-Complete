package lk.mobitel.abcbank.service.custom.impl;

import lk.mobitel.abcbank.dto.UserDTO;
import lk.mobitel.abcbank.entity.Customer;
import lk.mobitel.abcbank.entity.User;
import lk.mobitel.abcbank.exception.AddException;
import lk.mobitel.abcbank.repository.UserRepository;
import lk.mobitel.abcbank.service.custom.UserService;
import lk.mobitel.abcbank.service.util.Transformer;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    private final Transformer transformer;
    private final UserRepository userRepository;

    public UserServiceImpl(Transformer transformer, UserRepository userRepository) {
        this.transformer = transformer;
        this.userRepository = userRepository;
    }

    @Override
    public UserDTO saveUser(UserDTO userDTO) {
        User user = transformer.fromUserDTO(userDTO);
        userRepository.save(user);
        return userDTO;
    }

    @Override
    public void updateUser(UserDTO user) {
        userRepository.findById(user.getId()).orElseThrow(() -> new AddException(404,"No user associate with the id"));

        User newUser = transformer.fromUserDTO(user);
        userRepository.save(newUser);
    }

    @Override
    public void deleteUser(int id) {
        if(!userRepository.existsById(id)) throw new AddException(404, "No User Found");

        userRepository.deleteById(id);
    }

    @Override
    public UserDTO getUserDetails(int id) {
        Optional<User> optCustomer = userRepository.findById(id);
        if(optCustomer.isEmpty()) throw new AddException(404, "No Customer Found");
        optCustomer.get().setPassword(null);
        return transformer.toUserDTO(optCustomer.get());
    }

    @Override
    public List<UserDTO> getAllUsers() {
        List<User> userList;
        userList = userRepository.findAll();
        for (User user : userList) {
            user.setPassword(null);
        }
        return userList.stream().map(transformer::toUserDTO).collect(Collectors.toList());
    }
}
