package lk.mobitel.abcbank.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO implements Serializable {
    @Null(message = "Id should be null")
    private Integer id;
    @NotBlank(message = "Username can't be empty")
    @Pattern(regexp = "^[A-Za-z0-9 ]{3,}",message = "Invalid username")
    private String username;
    @NotBlank(message = "Password can't be empty")
    private String password;
    @NotNull(message = "Enabled can't be empty")
    private Boolean enabled;
    @NotNull(message = "Role should be either admin or user")
    private RoleDTO role;
}
