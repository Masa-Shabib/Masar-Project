package com.masar.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import com.masar.models.User;
import com.masar.repository.UserRepository;

@Component
public class UserValidator implements Validator {
	 private final UserRepository userRepository;
	 
    public UserValidator(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	//    1
    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }
    
    // 2
    @Override
    public void validate(Object object, Errors errors) {
        User user = (User) object;
        User oldUser =userRepository.findByEmail(user.getEmail());
        User oldUser2 =userRepository.findByUsername(user.getUsername());
        if (oldUser != null) {
            // 3
            errors.rejectValue("email", "Exist");
        } 
        
        if (oldUser2 != null) {
            // 3
            errors.rejectValue("username", "Exist");
        } 
        
        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
            // 3
            errors.rejectValue("passwordConfirmation", "Match");
        } 
        
        
    }
}