package lk.mobitel.abcbank.api;

import lk.mobitel.abcbank.dto.CustomerDTO;
import lk.mobitel.abcbank.dto.RoleDTO;
import lk.mobitel.abcbank.dto.UserDTO;
import lk.mobitel.abcbank.service.custom.RoleService;
import lk.mobitel.abcbank.service.custom.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.beans.Encoder;
import java.util.List;

@Controller
@CrossOrigin
public class UserHttpController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private PasswordEncoder encoder;

//    @InitBinder
//    public void initBinder(WebDataBinder binder) {
//        binder.registerCustomEditor(RoleDTO.class, new RoleDTOPropertyEditor());
//    }

    @RequestMapping(value = "/admin/new-user",method = RequestMethod.POST,consumes = "application/x-www-form-urlencoded")
    public String createUser(@ModelAttribute @Validated UserDTO userDTO){
        userDTO.setPassword(encoder.encode(userDTO.getPassword()));
        System.out.println(userDTO.getRole());
        userService.saveUser(userDTO);

        return "redirect:/users";
    }

    @RequestMapping(value = "/admin/update-user/{userId}",method = RequestMethod.GET)
    public String updateUser(@PathVariable int userId, ModelMap model){
        UserDTO userDetails = userService.getUserDetails(userId);
        List<RoleDTO> roleList = roleService.getAllRoles();
        model.put("userDetails",userDetails);
        model.put("roleList",roleList);

        return "update-user";
    }

    @RequestMapping(value = "/admin/update-user/{userId}",method = RequestMethod.POST)
    public String updateUser(@PathVariable int userId, @Validated UserDTO userDTO){
        userDTO.setPassword(encoder.encode(userDTO.getPassword()));
        userDTO.setId(userId);
        userService.updateUser(userDTO);

        return "redirect:/users";
    }

    @RequestMapping(value = "/admin/delete-user/{userId}",method = RequestMethod.GET)
    public String deleteUser(@PathVariable int userId){
        userService.deleteUser(userId);

        return "redirect:/users";
    }

    @RequestMapping(value = "/admin/users",method = RequestMethod.GET)
    public String getAllUsers(ModelMap model){
        List<UserDTO> userList = userService.getAllUsers();

//        for (UserDTO userDTO : userList) {
//            System.out.println(userDTO.getRole());
//        }
        List<RoleDTO> roleList = roleService.getAllRoles();
        model.put("userList",userList);
        model.put("roleList",roleList);
        return "users";
    }
}
