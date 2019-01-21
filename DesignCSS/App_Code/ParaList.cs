using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ParaList
/// </summary>
public class ParaList
{
    public ParaList()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    string _key = string.Empty;
    string _value = string.Empty;


    public ParaList(string key, string value)
    {
        _key = key;
        _value = value;
    }




    public string Key
    {
        get { return _key; }
        set { _key = value; }
    }


    public string Value
    {
        get { return _value; }
        set { _value = value; }
    }
}