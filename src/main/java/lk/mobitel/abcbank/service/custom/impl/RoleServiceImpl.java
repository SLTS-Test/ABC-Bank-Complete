package lk.mobitel.abcbank.service.custom.impl;

import lk.mobitel.abcbank.dto.RoleDTO;
import lk.mobitel.abcbank.entity.Role;
import lk.mobitel.abcbank.entity.User;
import lk.mobitel.abcbank.exception.AddException;
import lk.mobitel.abcbank.repository.RoleRepository;
import lk.mobitel.abcbank.repository.UserRepository;
import lk.mobitel.abcbank.service.custom.RoleService;
import lk.mobitel.abcbank.service.util.Transformer;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    private final Transformer transformer;
    private final RoleRepository roleRepository;

    public RoleServiceImpl(Transformer transformer, RoleRepository roleRepository) {
        this.transformer = transformer;
        this.roleRepository = roleRepository;
    }

    @Override
    public RoleDTO saveRole(RoleDTO roleDTO) {
        Role role = transformer.fromRoleDTO(roleDTO);
        roleRepository.save(role);
        return roleDTO;
    }

    @Override
    public void updateRole(RoleDTO role) {
        roleRepository.findById(role.getId()).orElseThrow(() -> new AddException(404,"No role associate with the id"));

        Role newRole = transformer.fromRoleDTO(role);
        roleRepository.save(newRole);
    }

    @Override
    public void deleteRole(int id) {
        if(!roleRepository.existsById(id)) throw new AddException(404, "No Role Found");

        roleRepository.deleteById(id);
    }

    @Override
    public RoleDTO getRoleDetails(int id) {
        Optional<Role> optRole = roleRepository.findById(id);
        if(optRole.isEmpty()) throw new AddException(404, "No Role Found");
        return transformer.toRoleDTO(optRole.get());
    }

    @Override
    public List<RoleDTO> getAllRoles() {
        List<Role> roleList;
        roleList = roleRepository.findAll();
        return roleList.stream().map(transformer::toRoleDTO).collect(Collectors.toList());
    }
}
