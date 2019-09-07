package pers.pluto.dao;

import org.apache.ibatis.annotations.*;
import pers.pluto.domain.Member;
import pers.pluto.domain.Orders;
import pers.pluto.domain.Product;

import java.util.List;

public interface IOrdersDao {

    @Select("select * from orders")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "orderNum",column = "orderNum"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "orderDesc",column = "orderDesc"),
            @Result(property = "product",column = "productId",javaType = Product.class,one = @One(select = "pers.pluto.dao.IProductDao.findById")),
    })
    public List<Orders> findAll() throws Exception;


    //多表操作
    @Select("select * from orders where id=#{ordersId}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "orderNum", column = "orderNum"),
            @Result(property = "orderTime", column = "orderTime"),
            @Result(property = "orderStatus", column = "orderStatus"),
            @Result(property = "peopleCount", column = "peopleCount"),
            @Result(property = "peopleCount", column = "peopleCount"),
            @Result(property = "payType", column = "payType"),
            @Result(property = "orderDesc", column = "orderDesc"),
            @Result(property = "product", column = "productId", javaType = Product.class, one = @One(select = "pers.pluto.dao.IProductDao.findById")),
            @Result(property = "member",column = "memberId",javaType = Member.class,one = @One(select = "pers.pluto.dao.IMemberDao.findById")),
            @Result(property = "travellers",column = "id",javaType =java.util.List.class,many = @Many(select = "pers.pluto.dao.ITravellerDao.findByOrdersId"))
    })
    public Orders findById(String ordersId) throws Exception;


}
