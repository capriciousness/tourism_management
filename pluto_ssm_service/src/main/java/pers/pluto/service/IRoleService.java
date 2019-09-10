package pers.pluto.service;



import pers.pluto.domain.Permission;
import pers.pluto.domain.Role;

import java.util.List;

public interface IRoleService {

    public List<Role> findAll() throws Exception;

    void save(Role role) throws Exception;

    void deleteRoleById(String roleId);

    Role findById(String roleId);

    void addPermissionToRole(String roleId, String[] permissionIds);

    List<Permission> findOtherPermissions(String roleId);
}
