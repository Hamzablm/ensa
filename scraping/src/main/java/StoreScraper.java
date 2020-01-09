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

public class StoreScraper {

    public static void main(String[] args) throws SQLException, IOException {
        Connection connection = DbConnection.dbConnector();
        String query="SELECT url_category FROM category";
        PreparedStatement stmt=connection.prepareStatement(query);
        ResultSet rs=stmt.executeQuery();


        while(rs.next()){

            for (int y = 1; y < 6; y++) {
                String url = rs.getString("url_category");
                String dynamic_url = url + "&page=" + y;
                Document doc = Jsoup.connect(dynamic_url).get();
                Elements body = doc.select(".sku.-gallery");

                for (Element element : body) {
                    if (element.select(".mabaya").attr("class").equals("hidden mabaya sku -gallery -hidden")) {
                        continue;
                    } else {

                        String product_url = element.select("a.link").attr("href");
                        System.out.println("URL PRODUCT  " + product_url + "\n");
                        Document doc1 = Jsoup.connect(product_url).get();
                        Elements body1 = doc1.select("div.-hr.-pas");

                        String store_name = body1.select("p.-m").text();
                        System.out.println("STORE NAME " + store_name + "\n");

                        String store_rating = body1.select("bdo.-m").text();
                        System.out.println("STORE RATING " + store_rating + "\n");

                        String store_url = " https://www.jumia.ma" + doc1.select("a.-pas.-df.-i-ctr.-upp").attr("href");
                        System.out.println("STORE URL " + store_url + "\n");

                        String query2 = "INSERT INTO store (name, total_rating, url_store) VALUES (?, ?, ?)";
                        PreparedStatement stmt2 = connection.prepareStatement(query2);
                        stmt2.setString(1,store_name);
                        stmt2.setString(2,store_rating);
                        stmt2.setString(3,store_url);
                        int rs2 = stmt2.executeUpdate();
                    }
                    String query1="DELETE FROM store t1 USING store t2 WHERE t1.id_store < t2.id_store AND t1.name = t2.name;";
                    PreparedStatement stmt1=connection.prepareStatement(query1);
                    int rs1=stmt1.executeUpdate();

                }
            }
        }
    }


}





