package lk.mobitel.abcbank.service.custom;

import lk.mobitel.abcbank.dto.CustomerDTO;
import lk.mobitel.abcbank.dto.UserDTO;
import lk.mobitel.abcbank.service.SuperService;

import java.util.List;

public interface UserService extends SuperService {
    UserDTO saveUser(UserDTO user);
    void updateUser(UserDTO user);
    void deleteUser(int id);
    UserDTO getUserDetails(int id);
    List<UserDTO> getAllUsers();
}
