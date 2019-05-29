package diy;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;

import biolockj.Config;
import biolockj.exception.ConfigPathException;
import biolockj.module.ScriptModuleImpl;

public class MyScript extends ScriptModuleImpl {

	@Override
	public List<List<String>> buildScript(List<File> files) throws Exception {
		final List<List<String>> data = new ArrayList<>();
		List<String> inner = new ArrayList<>();
		String localScript = getMyScript();
		inner.add(getLauncher() + localScript);
		if ( localScript.endsWith(".sh") ) {
			inner.add("touch " + localScript + "_Success");
		}
		data.add(inner);
		return data;
	}
	
	private String getLauncher() {
		String raw = Config.getString(this, LAUNCHER);
		if (raw == null || raw.isEmpty()) {
			return "";
		}
		return raw + " ";
	}
	
	private String getMyScript() throws ConfigPathException, IOException {
		File orig = Config.getExistingFile(this, MY_SCRIPT);
		FileUtils.copyFileToDirectory(orig, getScriptDir());
		File copy = new File(getScriptDir() + File.separator + orig.getName());
		copy.setExecutable(true, false);
		return copy.getAbsolutePath();
	}


	@Override
	public List<String> getWorkerScriptFunctions() throws Exception {
		final List<String> lines = super.getWorkerScriptFunctions();
		lines.add( "function " + RUN_ME + "() {" );
		//lines.add("cd dirname(${BASH_SOURCE[0]})");
		if ( getLauncher().length() > 0 ){
			lines.add("$1 $2");
		}else {
			lines.add("$1");
		}
		lines.add( "}" + RETURN );
		return lines;
	}

	
	private static String RUN_ME = "RunMe";
	private static String MY_SCRIPT = "myScript.myScript";
	private static String LAUNCHER = "myScript.launcher";
}
