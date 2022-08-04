Class User.Installer.MsgBank
{

XData setup
{
<Manifest>
  <Default Name="SourceDir" Value="/opt/feeder/src"/>
  <Default Name="Namespace" Value="SCM_MB"/>
  <Namespace Name="SCM_MB" Create="yes" Code="SCMDATA" Ensemble="1" Data="SCMDATA">
    <Configuration>
      <Database Name="SCMDATA" Dir="/usr/irissys/mgr/SCMDATA" Create="yes" MountRequired="true" Resource="%DB_SCMDATA" PublicPermissions="" MountAtStartup="true"/>
      <ClassMapping Package="HS" From="HSLIB"/>
      <ClassMapping Package="HS.Local" From="HSCUSTOM"/>
      <ClassMapping Package="HS.Local.VA.eSCM" From="SCMLIB"/>
      <RoutineMapping Routines="HS*" From="HSLIB"/>
    </Configuration>
      
    <Import File="${SourceDir}" Flags="ck" Recurse="1"/>
    <Invoke Class="%SYSTEM.OBJ" Method="Compile" CheckStatus="true">
      <Arg Value="HS.Local.VA.eSCM.Common.MsgBank.Production"/>
    </Invoke>
    <Production Name="HS.Local.VA.eSCM.Common.MsgBank.Production" AutoStart="1" />
  </Namespace>

<IfDef Var="Password">
    <User Username="_SYSTEM" PasswordVar="Password" Roles="%All" Enabled="true"/>
  </IfDef>
</Manifest>
}

ClassMethod setup(
	ByRef pVars,
	pLogLevel As %Integer = 3,
	pInstaller As %Installer.Installer,
	pLogger As %Installer.AbstractLogger) As %Status [ CodeMode = objectgenerator, Internal ]
{
  #; Let XGL document generate code for this method. 
  Quit ##class(%Installer.Manifest).%Generate(%compiledclass, %code, "setup")
}

}
