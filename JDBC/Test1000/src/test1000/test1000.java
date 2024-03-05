package test1000;

import java.util.ArrayList;

public class test1000 {
	
	public static void main(String[] args) throws ClassNotFoundException
	{
		 ArrayList objs = new ArrayList();
		 System.out.println("1. Adding elements to Array List");
		 objs.add(10);
		 objs.add("ratan");
		 objs.add(10);
		 objs.add(null);
		 objs.add(10.5);
		 System.out.println("2. Elements are added in the Array List");
		 System.out.println("The elements in the Array List are as follows:");
		 System.out.println(objs);
		 System.out.println("3. Remove element/elemensts from the Array List using index");
		 objs.remove(2);
		 System.out.println("4. After removing using index,The elements in the Array List are as follows:");
		 System.out.println(objs);
		 System.out.println("5. Remove element/elemensts from the Array List by not using index. But specifying a content");
		 objs.remove("ratan");
		 System.out.println("The elements in the Array List are as follows:");
		 System.out.println(objs);	
		 
	}
}