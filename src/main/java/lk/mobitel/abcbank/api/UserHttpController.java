package lk.mobitel.abcbank.api;

import lk.mobitel.abcbank.dto.UserDTO;
import lk.mobitel.abcbank.service.custom.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@CrossOrigin
public class UserHttpController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/admin/new-user",method = RequestMethod.POST)
    public void createUser(){

    }

    @RequestMapping(value = "/admin/update-user",method = RequestMethod.POST)
    public void updateUser(){

    }

    @RequestMapping(value = "/admin/delete-user",method = RequestMethod.GET)
    public void deleteUser(){

    }

    @RequestMapping(value = "/admin/users",method = RequestMethod.GET)
    public String getAllUsers(ModelMap model){
        List<UserDTO> userList = userService.getAllUsers();
        model.put("userList",userList);
        return "users";
    }
}
