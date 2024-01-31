package lk.mobitel.abcbank.service.custom;

import lk.mobitel.abcbank.dto.RoleDTO;
import lk.mobitel.abcbank.dto.UserDTO;
import lk.mobitel.abcbank.service.SuperService;

import java.util.List;

public interface RoleService extends SuperService {
    RoleDTO saveRole(RoleDTO role);
    void updateRole(RoleDTO role);
    void deleteRole(int id);
    RoleDTO getRoleDetails(int id);
    List<RoleDTO> getAllRoles();
}
