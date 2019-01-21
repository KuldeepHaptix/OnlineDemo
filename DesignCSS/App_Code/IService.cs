using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService" in both code and config file together.
[ServiceContract]
public interface IService
{
    [OperationContract]
    DataSet list(List<ParaList> para, string ModuleName);

    [OperationContract]
    void Insert(List<ParaList> para, string ModuleName);

    [OperationContract]
    DataSet InsertWithDataset(List<ParaList> para, string ModuleName);

    [OperationContract]
    void Update(List<ParaList> para, string ModuleName);

    [OperationContract]
    void Delete(List<ParaList> para, string ModuleName);

    [OperationContract]
    DataSet FillDDL(List<ParaList> paraDelete, string ModuleName);

    [OperationContract]
    DataSet Select(List<ParaList> para, string ModuleName);

    [OperationContract]
    DataSet AutomaticNumber(List<ParaList> para);

    [OperationContract]
    DataSet LOV(List<ParaList> para, string ModuleName);

    //    [OperationContract]
    //    CompositeType GetDataUsingDataContract(CompositeType composite);

    //    TODO: Add your service operations here
}

//Use a data contract as illustrated in the sample below to add composite types to service operations.
[DataContract]

public class ParameterList
{
    string _key = string.Empty;
    string _value = string.Empty;






    [DataMember]
    public string Key
    {
        get { return _key; }
        set { _key = value; }
    }

    [DataMember]
    public string Value
    {
        get { return _value; }
        set { _value = value; }
    }
}
