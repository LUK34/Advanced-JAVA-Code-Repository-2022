package test1000;

import java.util.ArrayList;
import java.util.Collections;

public class test1001 
{

	public static void main(String[] args) 
	{
		// TODO Auto-generated method stub
		ArrayList objs = new ArrayList();
		 System.out.println("Adding elements to Array List");
		 objs.add("ratan");
		 objs.add("Apple");
		 objs.add("Oranges");
		 objs.add("Watermelon");
		 System.out.println("OUTPUT:");
		 System.out.println(objs);
		 
		 System.out.println("Sorting in Ascending Order:");
		 Collections.sort(objs);
		 System.out.println("OUTPUT:");
		 System.out.println(objs);
		 
		 System.out.println("Sorting in Descending Order:");
		 Collections.sort(objs, Collections.reverseOrder());
		 System.out.println("OUTPUT:");
		 System.out.println(objs);
	}
}
