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
import java.util.Random;


public class ProductAndStore {

    public static void main(String[] args) throws SQLException, IOException {

        Connection connection = DbConnection.dbConnector();
        String query = "SELECT url_category, id_category FROM category";
        PreparedStatement stmt = connection.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            for (int y = 1; y < 6; y++) {

                String url = rs.getString("url_category");
                int idCategory = rs.getInt("id_category");
                System.out.println(idCategory + "\n");
                String dynamic_url = url + "&page=" + y;
                Document doc = Jsoup.connect(dynamic_url).get();
                Elements body = doc.select(".sku.-gallery");

                for (Element element : body) {
                    if (element.select(".mabaya").attr("class").equals("hidden mabaya sku -gallery -hidden")) {
                        continue;
                    } else {
                        String product_name = element.select("h2.title span.name").text();
                        System.out.println("PRODUCT NAME  " + product_name + "\n");

                        int product_sales = new Random(10).nextInt(300);
                        System.out.println("PRODUCT Sales " + product_sales + "\n");

                        String product_rating = element.select("div.rating-stars div.total-ratings").text();
                        System.out.println("PRODUCT TOTAL RATINGS " + product_rating + "\n");

                        long millis = System.currentTimeMillis();
                        java.sql.Date product_date = new java.sql.Date(millis);
                        System.out.println("PRODUCT DATE " + product_date + "\n");

                        String product_img_url = element.select("div.image-wrapper.default-state img").attr("data-src");
                        System.out.println("IMAGE URL : " + product_img_url + "\n");

                        String product_url = element.select("a.link").attr("href");
                        System.out.println("PRODUCT URL  " + product_url + "\n");

                        String product_price = element.select("span.price span").attr("data-price");
                        System.out.println("PRODUCT PRICE: " + product_price + "\n");

                        Document doc1 = Jsoup.connect(product_url).get();
                        Elements body1 = doc1.select("div.-hr.-pas");
                        String store_name = body1.select("p.-m").text();
                        System.out.println("STORE NAME " + store_name + "\n");
                        String store_rating = body1.select("bdo.-m").text();
                        System.out.println("STORE RATING " + store_rating + "\n");
                        String store_url = " https://www.jumia.ma" + doc1.select("a.-pas.-df.-i-ctr.-upp").attr("href");
                        System.out.println("STORE URL " + store_url + "\n");

                        String query6 = "SELECT * FROM store where name = ? and url_store = ? ";
                        PreparedStatement stmt6 = connection.prepareStatement(query6);
                        stmt6.setString(1, store_name);
                        stmt6.setString(2, store_url);
                        ResultSet rs6 = stmt6.executeQuery();
                        int count = 0;
                        while (rs6.next()) {
                            count++;
                        }

                        System.out.println(" rs = " + rs6 + "\n");
                        if (count == 0) {
                            String query1 = "INSERT INTO store (name, total_rating, url_store) VALUES (?, ?, ?)";
                            PreparedStatement stmt1 = connection.prepareStatement(query1);
                            stmt1.setString(1, store_name);
                            stmt1.setString(2, store_rating);
                            stmt1.setString(3, store_url);
                            int rs1 = stmt1.executeUpdate();
                        }

                        String query5 = "SELECT * FROM product where url_product = ? ";
                        PreparedStatement stmt5 = connection.prepareStatement(query5);
                        stmt5.setString(1,product_url);
                        ResultSet rs5 = stmt5.executeQuery();
                        int count2 = 0;
                        while (rs5.next()) {
                            count2++;
                        }
                        if (count2 == 0) {
                            String query3 = "SELECT id_store FROM store where name = ? and url_store = ? ";
                            PreparedStatement stmt3 = connection.prepareStatement(query3);
                            stmt3.setString(1, store_name);
                            stmt3.setString(2, store_url);
                            ResultSet rs3 = stmt3.executeQuery();
                            int id_store = 0;
                            if (rs3.next()) {
                                id_store = rs3.getInt("id_store");
                                System.out.println(" STORE ID " + id_store + "\n");
                            }
                            System.out.println(" STORE ID " + id_store + "\n");


                            String query4 = "INSERT INTO product (name, sales, total_rating , date_product , url_image , url_product , id_category,id_store , price) VALUES (?, ?, ?, ?, ?, ?, ?, ? ,?)";
                            PreparedStatement stmt4 = connection.prepareStatement(query4);
                            stmt4.setString(1, product_name);
                            stmt4.setInt(2, product_sales);
                            stmt4.setString(3, product_rating);
                            stmt4.setDate(4, product_date);
                            stmt4.setString(5, product_img_url);
                            stmt4.setString(6, product_url);
                            stmt4.setInt(7, idCategory);
                            stmt4.setInt(8, id_store);
                            stmt4.setString(9, product_price);
                            int rs4 = stmt4.executeUpdate();
                            System.out.println("*******************" + rs4 + "\n");

                            String query8 = "SELECT * FROM product where url_product = ? ";
                            PreparedStatement stmt8 = connection.prepareStatement(query8);
                            stmt8.setString(1, product_url);
                            ResultSet rs8 = stmt8.executeQuery();
                            if (rs8.next()) {
                                int product_ID = rs8.getInt("id_product");

                                String query7 = " INSERT INTO legacy_price(new_price,id_product, id_category, id_store) VALUES(? , ? , ? , ?)";
                                PreparedStatement stmt7 = connection.prepareStatement(query7);
                                stmt7.setString(1, product_price);
                                stmt7.setInt(2, product_ID);
                                stmt7.setInt(3, idCategory);
                                stmt7.setInt(4, id_store);
                                int rs7 = stmt7.executeUpdate();
                            }
                            //prob : random generates same number for product's sales
                            System.out.println("************************************************************ \n\n");


                        }
                    }
                }
            }

        }

    }
}


