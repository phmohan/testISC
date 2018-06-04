Class test.test Extends Ens.DataTransformDTL [ DependsOn = Ens.AlertRequest ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Ens.AlertRequest' targetClass='Ens.AlertRequest' create='new' language='objectscript' >
<assign value='source.SourceConfigName' property='target.SourceConfigName' action='set' />
<assign value='source.AlertText' property='target.AlertText' action='set' />
<assign value='..Lookup("Alerts.CustomDeliveryInfo",source.SourceConfigName)' property='target.AlertDestination' action='set' />
<assign value='source.AlertTime' property='target.AlertTime' action='set' />
<assign value='source.SessionId' property='target.SessionId' action='set' />
<assign value='##class(Mohan.Operation.EnsAlertToSoapAlert).SendEmail(source.SourceConfigName,source.AlertText,target.AlertDestination,0)' property='tSC' action='set' />
</transform>
}

}
