package pers.pluto.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import pers.pluto.domain.Product;

import java.util.List;

@Repository
public interface IProductDao {

    //根据id查询产品
    @Select("select * from product where id=#{id}")
    public Product findById(String id) throws Exception;


    //查询所有的产品信息
    @Select("select * from product")
    public List<Product> findAll() throws Exception;


    //添加产品信息
    @Insert("insert into product(productNum,productName,cityName,departureTime,productPrice,productDesc,productStatus) values(#{productNum},#{productName},#{cityName},#{departureTime},#{productPrice},#{productDesc},#{productStatus})")
    void save(Product product);



}
