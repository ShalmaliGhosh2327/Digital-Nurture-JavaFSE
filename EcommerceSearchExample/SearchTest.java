public class SearchTest {


    public static void main(String[] args) {



        Product[] products = {


            new Product(1,"Laptop","Electronics"),

            new Product(2,"Mobile","Electronics"),

            new Product(3,"Shoes","Fashion"),

            new Product(4,"Watch","Accessories"),

            new Product(5,"Book","Education")

        };



        System.out.println("Linear Search:");

        Product result1 = Search.linearSearch(products,"Shoes");



        if(result1 != null)

            result1.displayProduct();

        else

            System.out.println("Product not found");






        Product[] sortedProducts = {


            new Product(5,"Book","Education"),

            new Product(1,"Laptop","Electronics"),

            new Product(2,"Mobile","Electronics"),

            new Product(3,"Shoes","Fashion"),

            new Product(4,"Watch","Accessories")

        };



        System.out.println("\nBinary Search:");

        Product result2 = Search.binarySearch(sortedProducts,"Shoes");



        if(result2 != null)

            result2.displayProduct();

        else

            System.out.println("Product not found");


    }

}
