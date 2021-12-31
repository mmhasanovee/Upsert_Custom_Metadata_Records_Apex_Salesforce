public with sharing class MetadataUtility {
    public MetadataUtility() {

    }

    public static void upsertRecord(Boolean value){
       //fetch records
       List<HasanStudies__Information__mdt> metaList = 
       [Select MasterLabel, DeveloperName, HasanStudies__Valid__c From HasanStudies__Information__mdt];
       
       //instance of the record
       Metadata.CustomMetadata mdata = new Metadata.CustomMetadata();
       mdata.fullName = 'HasanStudies__Information__mdt.HasanStudies__'+'NewDeveloperName';
       mdata.label = metaList[0].MasterLabel;
       
       //instance of the value
       Metadata.CustomMetadataValue instance = new Metadata.CustomMetadataValue();
       instance.field = 'HasanStudies__Valid__c';
       instance.value = value;
       
       //adding the value to the record
       mdata.values.add(instance);
       
       //instance of the container
       Metadata.DeployContainer container = new Metadata.DeployContainer();
       container.addMetadata(mdata);
       
       //enqueue deployment to the salesforce org
       Metadata.Operations.enqueueDeployment(container, null);
       
    }
}