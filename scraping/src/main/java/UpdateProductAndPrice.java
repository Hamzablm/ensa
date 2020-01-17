package main.java;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Random;

import static org.postgresql.jdbc.PgResultSet.toInt;

public class UpdateProductAndPrice {

    public static void main(String[] args) throws SQLException, IOException {
        UpdateToDatabase();
    }
    private static void UpdateToDatabase() throws SQLException, IOException{
        Connection connection = DbConnection.dbConnector();
        String query = "SELECT url_category, id_category FROM category";
        PreparedStatement stmt = connection.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            for (int y = 1; y < 3; y++) {

                String url = rs.getString("url_category");
                int idCategory = rs.getInt("id_category");
//                System.out.println(idCategory + "\n");
                String dynamic_url = url + "&page=" + y;
                Document doc = Jsoup.connect(dynamic_url).get();
                Elements body = doc.select(".sku.-gallery");

                for (Element element : body) {
                    if (element.select(".mabaya").attr("class").equals("hidden mabaya sku -gallery -hidden")) {
                        continue;
                    } else {
                        String product_name = element.select("h2.title span.name").text();
//                        System.out.println("PRODUCT NAME  " + product_name + "\n");

                        int product_sales = new Random(10).nextInt(300);
//                        System.out.println("PRODUCT Sales " + product_sales + "\n");

                        String product_rating = element.select("div.rating-stars div.total-ratings").text();
//                        System.out.println("PRODUCT TOTAL RATINGS " + product_rating + "\n");

                        long millis = System.currentTimeMillis();
                        java.sql.Date product_date = new java.sql.Date(millis);
//                        System.out.println("PRODUCT DATE " + product_date + "\n");

                        String product_img_url = element.select("div.image-wrapper.default-state img").attr("data-src");
//                        System.out.println("IMAGE URL : " + product_img_url + "\n");

                        String product_url = element.select("a.link").attr("href");
//                        System.out.println("PRODUCT URL  " + product_url + "\n");

                        String product_price = element.select("span.price span").attr("data-price");
//                        System.out.println("PRODUCT PRICE: " + product_price + "\n");

                        String query3 = "SELECT * FROM product where url_product = ? ";
                        PreparedStatement stmt3 = connection.prepareStatement(query3);
                        stmt3.setString(1, product_url);
                        ResultSet rs3 = stmt3.executeQuery();
                        if (rs3.next()) {
                            String oldPrice = rs3.getString("price");
                            if(!(oldPrice.equals(product_price)) ){
                                int id_prod = rs3.getInt("id_product");
                                int id_categ = rs3.getInt("id_category");
                                int id_str = rs3.getInt("id_store");
                                Date date_prod = rs3.getDate("date_product");
                                String newPrice = product_price ;
                                String query1 = "INSERT INTO legacy_price (new_price, date , id_product , id_category , id_store) VALUES (? , ? ,?, ?, ?)";
                                PreparedStatement stmt1 = connection.prepareStatement(query1);
                                stmt1.setInt(1, toInt(newPrice));
                                stmt1.setDate(2, (java.sql.Date) date_prod);
                                stmt1.setInt(3, id_prod);
                                stmt1.setInt(4, id_categ);
                                stmt1.setInt(5, id_str);
                                int rs1 = stmt1.executeUpdate();


                            }
                        }

                        String query4 = "UPDATE product SET name = ? ,sales = ? ,total_rating = ? ,url_image = ? ,id_category = ? , price = ? where url_product = ?";
                        PreparedStatement stmt4 = connection.prepareStatement(query4);
                        stmt4.setString(1, product_name);
                        stmt4.setInt(2, product_sales);
                        stmt4.setString(3, product_rating);
                        stmt4.setString(4, product_img_url);
                        stmt4.setInt(5, idCategory);
                        stmt4.setString(6, product_price);
                        stmt4.setString(7, product_url);
                        int rs4 = stmt4.executeUpdate();
//                        System.out.println("*******************" + rs4 + "\n");
                        //prob : random generates same number for product's sales
//                        System.out.println("************************************************************ \n\n");


                    }
                }
            }
        }

    }
}




