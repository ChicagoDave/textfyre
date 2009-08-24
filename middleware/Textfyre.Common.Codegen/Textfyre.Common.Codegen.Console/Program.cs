using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using sc = System.Console;
using Textfyre.Common.Codegen.Framework;
namespace Textfyre.Common.Codegen.Console {
    public class Program {
        static int Main(string[] args) {
            bool argumentsStartWithSlash = true;
            string systemNamespace = "Textfyre";
            string rootNamespace = "Database";
            string mainPath = String.Empty;
            string detailsPath = String.Empty;
            string generatedPath = String.Empty;
            string tables = String.Empty;
            string database = String.Empty;
            string connectionString = String.Empty;
            bool overwrite = false;
            string spXMLFilePath = String.Empty;
            string spXMLDirectory = String.Empty;

            sc.WriteLine("Textfyre - Middleware Generator - v2009.08.21 (type /? for help)");

            try {
                if (args.Length > 9 || args.Length == 0) {
                    sc.WriteLine("Invalid number of arguments... use /? for help");
                    return 1;
                }

                foreach (string argument in args) {
                    if (!argument.StartsWith("/")) {
                        sc.WriteLine("All arguments must begin with a '/'.");
                        argumentsStartWithSlash = false;
                        return 1;
                    }
                }

                if (argumentsStartWithSlash) {
                    //if user enters ? as the first and only argument, show the help info.
                    if (args[0] == "/?") {
                        sc.WriteLine("Use the following parameters, in any order.");
                        sc.WriteLine("For Table-based Code Generation:");
                        sc.WriteLine("   /sn=<systemNamespace> ....... System namespace for the classes.");
                        sc.WriteLine("   /ns=<rootNamespace> ......... Root namespace for the classes.");
                        sc.WriteLine("   /mp=<mainPath> .............. Directory for domain classes.");
                        sc.WriteLine("   /sp=<subClassPath>........... Directory for sub classes.");
                        sc.WriteLine("   /gp=<generatedPath> ......... Directory for generated classes.");
                        sc.WriteLine("   /tb=<table> ................. SQL Server Table to generate");
                        sc.WriteLine("   /db=<database> .............. Database name.");
                        sc.WriteLine("   /cs=<conn> .................. SQL Connection String.");
                        sc.WriteLine("   /ow ......................... Overwrite Data and Recordset classes");
                        sc.WriteLine();
                        sc.WriteLine("For Stored Procedure-based Code Generation:");
                        sc.WriteLine("   /mp=<mainPath> .............. Directory for domain classes.");
                        sc.WriteLine("   /sp=<subClassPath>........... Directory for sub classes.");
                        sc.WriteLine("   /gp=<generatedPath> ......... Directory for generated classes.");
                        sc.WriteLine("   /sx=<xmlFilePath> ........... File path to xml file for stored procedure");
                        sc.WriteLine();
                        sc.WriteLine("For Stored Procedure-based Code Generation (batch):");
                        sc.WriteLine("   /sb=<xmlFilePath> ........... Directory to xml files (*.config) for stored procedures");
                        return 1;
                    }


                    for (int a = 0; a < args.Length; a++) {
                        if (args[a].StartsWith("/sn"))
                        {
                            systemNamespace = args[a].Replace("/sn=", "");
                            continue;
                        }
                        if (args[a].StartsWith("/ns"))
                        {
                            rootNamespace = args[a].Replace("/ns=", "");
                            continue;
                        }
                        if (args[a].StartsWith("/mp="))
                        {
                            mainPath = args[a].Replace("/mp=", "");
                            continue;
                        }
                        if (args[a].StartsWith("/sp=")) {
                            detailsPath = args[a].Replace("/sp=", "");
                            continue;
                        }
                        if (args[a].StartsWith("/gp=")) {
                            generatedPath = args[a].Replace("/gp=", "");
                            continue;
                        }
                        if (args[a].StartsWith("/tb=")) {
                            tables = args[a].Replace("/tb=", "");
                            continue;
                        }
                        if (args[a].StartsWith("/db=")) {
                            database = args[a].Replace("/db=", "");
                            continue;
                        }
                        if (args[a].StartsWith("/cs=")) {
                            connectionString = args[a].Replace("/cs=", "");
                            continue;
                        }
                        if (args[a].StartsWith("/sx=")) {
                            spXMLFilePath = args[a].Replace("/sx=", "");
                            continue;
                        }
                        if (args[a].StartsWith("/sb=")) {
                            spXMLDirectory = args[a].Replace("/sb=", "");
                            continue;
                        }
                        if (args[a].StartsWith("/ow")) {
                            overwrite = true;
                        }
                    }

                    if (!Directory.Exists(mainPath))
                        Directory.CreateDirectory(mainPath);
                    if (!Directory.Exists(detailsPath))
                        Directory.CreateDirectory(detailsPath);
                    if (!Directory.Exists(generatedPath))
                        Directory.CreateDirectory(generatedPath);

                    List<string> tableList = new List<string>();
                    foreach (string tbl in tables.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
                        tableList.Add(tbl);

                    try {
                        FrameworkDriver driver = new FrameworkDriver();
                        if (String.IsNullOrEmpty(spXMLFilePath) && String.IsNullOrEmpty(spXMLDirectory)) {
                            sc.Write(String.Format("Generating code for {0}.", tables));
                            driver.GenerateClasses(rootNamespace, mainPath, detailsPath, generatedPath, tableList, database, connectionString, overwrite);
                        } else
                            if (!String.IsNullOrEmpty(spXMLDirectory)) {
                                DirectoryInfo dirInfo = new DirectoryInfo(spXMLDirectory);
                                FileInfo[] configList = dirInfo.GetFiles("*.config");
                                sc.WriteLine(String.Format("Generating code for {0} stored procedures:", configList.Length));
                                foreach (FileInfo configFile in configList) {
                                    sc.WriteLine(string.Format("   Generating: {0}.", configFile.Name));
                                    driver.GenerateClasses(systemNamespace, mainPath, detailsPath, generatedPath, overwrite, configFile.FullName);
                                }
                            } else {
                                sc.Write(string.Format("Generating code for the stored procedure: {0}.", spXMLFilePath));
                                driver.GenerateClasses(systemNamespace, mainPath, detailsPath, generatedPath, overwrite, spXMLFilePath);
                            }
                    } catch (Exception e) {
                        sc.WriteLine(" - Error in codegen tool - " + e.Message);
                        return 2;
                    }
                }
            } catch (Exception e) {
                sc.WriteLine(" - Error in argument list - " + e.Message);
                return 1;
            }

            sc.WriteLine(" - Completed successfully.");
            return 0;
        }

        /* ilmerge /lib:C:\Projects\NextGen\OD\Textfyre.Common.Codegen\Textfyre.Common.Codegen.Console\bin\Release /t:exe /out:C:\Projects\NextGen\OD\Textfyre.Common.Codegen\Textfyre.Common.Codegen.Console\bin\Release\cgen.exe Textfyre.Common.Codegen.Console.exe Textfyre.Common.Codegen.Framework.dll Textfyre.Common.Utilities.dll
copy $(TargetDir)cgen.exe C:\Build\Tools\ */

    }
}
