package com.masar.services;

import java.util.ArrayList;
import java.util.List;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.masar.models.Role;
import com.masar.models.User;
import com.masar.repository.UserRepository;

@Service
public class UserDetailsServiceImplementation implements UserDetailsService {
    private UserRepository userRepository;
    
    public UserDetailsServiceImplementation(UserRepository userRepository){
        this.userRepository = userRepository;
    }
    // 1
    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        User user = userRepository.findByEmail(userName);
        
        if(user == null) {
            throw new UsernameNotFoundException("User not found");
        }
        System.out.println(user.getEmail());
        System.out.println( user.getPassword());
        System.out.println( getAuthorities(user));
        return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), getAuthorities(user));
    }
    
    

    
    // 2
    private List<GrantedAuthority> getAuthorities(User user){
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        for(Role role : user.getRoles()) {
            GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(role.getName());
            authorities.add(grantedAuthority);
        }
        return authorities;
    }
}
