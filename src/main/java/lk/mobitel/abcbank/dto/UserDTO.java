package lk.mobitel.abcbank.dto;


import lk.mobitel.abcbank.util.RoleType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO implements Serializable {
    private Integer id;
    @NotBlank(message = "Username can't be empty")
    @Pattern(regexp = "^[A-Za-z0-9 ]{3,}",message = "Invalid username")
    private String username;
    @NotBlank(message = "Password can't be empty")
    private String password;
    @NotNull(message = "Role should be either admin or it-user or user")
    private RoleType role;
}
