package com.talentrecd.util;

import java.util.ResourceBundle;

public class SystemUtil {
	
	public static final String APPLICATION_FILE = "env";
	

	public static String getAppConfig(String configItem){
		
		ResourceBundle resourceBundle =
		      ResourceBundle.getBundle(APPLICATION_FILE);

		return resourceBundle.getString(configItem);
	}

}
