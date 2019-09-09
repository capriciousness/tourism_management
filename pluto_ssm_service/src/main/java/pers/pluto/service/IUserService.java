package pers.pluto.service;

import org.springframework.security.core.userdetails.UserDetailsService;
import pers.pluto.domain.UserInfo;

import java.util.List;

public interface IUserService extends UserDetailsService {
    List<UserInfo> findAll() throws Exception;

    void save(UserInfo userInfo) throws Exception;

    UserInfo findById(String id) throws Exception;
}
