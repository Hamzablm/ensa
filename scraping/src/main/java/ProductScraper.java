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

//TODO: Refactor
public class ProductScraper {
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


                        String query1 = "SELECT id_store FROM store where name = ? ";
                        PreparedStatement stmt1 = connection.prepareStatement(query1);
                        stmt1.setString(1, store_name);
                        ResultSet rs1 = stmt1.executeQuery();
                        int id_store = 0;
                        if (rs1.next()) {
                            id_store = rs1.getInt("id_store");
                            System.out.println(" STORE ID " + id_store + "\n");
                        }
                        System.out.println(" STORE ID " + id_store + "\n");

                        String query2 = "INSERT INTO product (name, sales, total_rating , date_product , url_image , url_product , id_category , id_store , price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                        PreparedStatement stmt2 = connection.prepareStatement(query2);
                        stmt2.setString(1, product_name);
                        stmt2.setInt(2, product_sales);
                        stmt2.setString(3, product_rating);
                        stmt2.setDate(4, product_date);
                        stmt2.setString(5, product_img_url);
                        stmt2.setString(6, product_url);
                        stmt2.setInt(7, idCategory);
                        stmt2.setInt(8, id_store);
                        stmt2.setString(9, product_price);
                        int rs2 = stmt2.executeUpdate();
                        System.out.println("*******************" + rs2 + "\n");


                        System.out.println("************************************************************ \n\n");


                    }
                }
            }
        }

    }

}
