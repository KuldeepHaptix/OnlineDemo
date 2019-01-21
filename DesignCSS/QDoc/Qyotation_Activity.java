package com.example.f.myapplication;

import android.Manifest;
import android.app.Activity;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.Typeface;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.text.format.DateUtils;
import android.util.Log;
import android.util.SparseBooleanArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CheckedTextView;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.f.myapplication.helper.Category_List;
import com.example.f.myapplication.helper.Category_List_Array;
import com.example.f.myapplication.helper.Comp_info_List;
import com.example.f.myapplication.helper.Comp_info_List_Array;
import com.example.f.myapplication.helper.Coust_Item_List;
import com.example.f.myapplication.helper.Coust_Item_List_Array;
import com.example.f.myapplication.helper.Customer_List;
import com.example.f.myapplication.helper.Customer_List_Array;
import com.example.f.myapplication.helper.Emp_List;
import com.example.f.myapplication.helper.Emp_List_Array;
import com.example.f.myapplication.helper.Item_List;
import com.example.f.myapplication.helper.Item_List_Array;
import com.example.f.myapplication.helper.PrefUtils;
import com.example.f.myapplication.helper.RetrfitInterface;
import com.example.f.myapplication.helper.TNCSub_List;
import com.example.f.myapplication.helper.TNCSub_List_Array;
import com.example.f.myapplication.helper.Text_class_List;
import com.example.f.myapplication.helper.Text_class_List_Array;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPRow;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.joanzapata.pdfview.PDFView;
import com.joanzapata.pdfview.listener.OnPageChangeListener;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import retrofit.Callback;
import retrofit.RestAdapter;
import retrofit.RetrofitError;
import retrofit.client.Response;
import retrofit.mime.TypedByteArray;

public class Qyotation_Activity extends AppCompatActivity implements OnPageChangeListener {

    FrameLayout inq_date_l, ap_take_ly, allocated_ly, c_name_l, add_item_ly, tclass_ly, add_txt_terms_ly, sent_email, next_folllow;
    private DatePickerFragment4 fragment;
    String date, f_date, f_next_date;
    TextView inq_date, txt_ap_take, txt_allocated, txt_c_name, txt_tclass, next_date;
    Dialog dialog, dialogterm, dialogcat, dialog_item, dialogcat134, dialogshowlist;
    String userID, compID, state_ID, city_ID, allocated_ID, ap_take_ID, area_ID, c_name_ID, tclass_ID;
    private ProgressDialog loading;
    EditText txt_con_per, txt_email, txt_mob_no, txt_address, txt_category, txt_item_desc, txt_refer, txt_subject, txt_Remarks;
    LinearLayout category_ly;
    TextView txt_sgst_per, txt_cgst_per, txt_igst_per;
    String SGST, CGST, IGST;
    TextView txt_sgst, txt_cgst, txt_igst;
    TextView txt_amount;
    TextView txt_net_amount;
    TextView txt_net_ammount2, txt_discount, txt_total_Ammount;
    Float txt_qty_t, txt_rate_t1, txt_discount_f;
    ArrayList<String> arrayList;
    SparseBooleanArray sparseBooleanArray;
    CheckBox email_sent;
    String y;
    LinearLayout btn_Submit, btn_Submit_qu;
    String return_val_in_english;
    long Cnt;
    String f_inq_date, f_txt_c_name, f_txt_con_per, f_txt_address, f_txt_email, f_txt_mob_no, f_txt_refer;
    String f_txt_category, f_txt_subject, f_txt_Remarks;
    String f_txt_ap_take, f_txt_allocated, f_txt_total_Ammount, f_total_net_amount, f_total_sgst, f_total_cgst, f_total_f_amount;
    String Name1, Name2, Name3, Name4, Name5, Name6, Value1, Value2, Value3, Value4, Value5, Value6;

    ScrollView scrol1;

    String f__SGST, f__CGST, f__IGST, Date_s;
    //----------------  PDF  ----------------//


    private static final String TAG = "PdfCreatorActivity";
    private Button mCreateButton, button_send;
    private File pdfFile;
    final private int REQUEST_CODE_ASK_PERMISSIONS = 111;
    private Paragraph paragraph;
    private Font fTitle1 = new Font(Font.FontFamily.TIMES_ROMAN, 10, Font.BOLD, BaseColor.BLACK);
    private Font fTitle = new Font(Font.FontFamily.TIMES_ROMAN, 22, Font.BOLD, BaseColor.BLACK);
    Uri uri;
    private Font f_sTitle = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
    private Font fs_item = new Font(Font.FontFamily.TIMES_ROMAN, 10, Font.NORMAL, BaseColor.BLACK);
    private Font fs_amount = new Font(Font.FontFamily.TIMES_ROMAN, 10, Font.BOLD, BaseColor.BLACK);


    private Font f_sTitle10 = new Font(Font.FontFamily.TIMES_ROMAN, 10, Font.BOLD, BaseColor.BLACK);
    private Font fs_item10 = new Font(Font.FontFamily.TIMES_ROMAN, 10, Font.NORMAL, BaseColor.BLACK);
    CustomAdapter customAdapter;

    String email;
    private Font fSubTitle = new Font(Font.FontFamily.TIMES_ROMAN, 13);
    private Font fSubTitle1 = new Font(Font.FontFamily.TIMES_ROMAN, 12);
    private Font fText = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
    private Font fHighText = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD, BaseColor.RED);
    String[] header = {"Id", "Nombre", "Apellido"};
    ArrayList<String[]> row;
    Bitmap bmp;
    private PDFView pdfView;
    private int num = 1;

    TNCSub_List_Array tNCSub_list_array;
    final String username = "saleskitsoftware@gmail.com";
    final String password = "Anjohm@2482";

    String kj;
    //----------------  END PDF  ----------------//
    ArrayList<String> selectedItems;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_quotation);
        pdfView = (PDFView) findViewById(R.id.pdf_view);

        scrol1 = (ScrollView) findViewById(R.id.scrol1);
        selectedItems = new ArrayList<String>();

        Drawable d = getResources().getDrawable(R.drawable.shader);
        BitmapDrawable bitDw = ((BitmapDrawable) d);
        bmp = bitDw.getBitmap();
        kj = "0";
        y = "0";

        SGST = "";
        CGST = "";
        IGST = "";
        next_date = (TextView) findViewById(R.id.next_date);
        next_folllow = (FrameLayout) findViewById(R.id.next_folllow);
        next_folllow.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Date_s = "2";
                showDatePickerDialog();
            }
        });


        txt_total_Ammount = (TextView) findViewById(R.id.txt_total_Ammount);
        userID = PrefUtils.gete_User_id(Qyotation_Activity.this);
        compID = PrefUtils.gete_Comp_Id(Qyotation_Activity.this);
        ap_take_ID = "0";
        Date c = Calendar.getInstance().getTime();
        System.out.println("Current time => " + c);
        SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");


        Log.e("f_date__", "" + f_date);
        SimpleDateFormat df1 = new SimpleDateFormat("MM/dd/yyyy");
        date = df1.format(c);
        f_date = df1.format(c);

        f_next_date = df1.format(c);
        next_date.setText(f_next_date);
        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
        inq_date = (TextView) findViewById(R.id.inq_date);
        inq_date.setText(date);
        inq_date_l = (FrameLayout) findViewById(R.id.inq_date_l);
        inq_date_l.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Date_s = "1";
                showDatePickerDialog();
            }
        });

        btn_Submit_qu = (LinearLayout) findViewById(R.id.btn_Submit_qu);

        add_txt_terms_ly = (FrameLayout) findViewById(R.id.add_txt_terms_ly);
        add_txt_terms_ly.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                if (PrefUtils.get_tncsub_List_Array(Qyotation_Activity.this) != null) {


                    dialogterm = new Dialog(Qyotation_Activity.this);
                    dialogterm.requestWindowFeature(Window.FEATURE_NO_TITLE);
                    dialogterm.getWindow().setBackgroundDrawable(new ColorDrawable(android.graphics.Color.TRANSPARENT));
                    dialogterm.setContentView(R.layout.dialog_t_c_listcat);

                    LinearLayout button = (LinearLayout) dialogterm.findViewById(R.id.button);
                    LinearLayout main_t_c = (LinearLayout) dialogterm.findViewById(R.id.main_t_c);

                    TNCSub_List_Array tncsub_List_Array = PrefUtils.get_tncsub_List_Array(Qyotation_Activity.this);



                    LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                            LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT,1f);

                    LinearLayout.LayoutParams params1 = new LinearLayout.LayoutParams(60, 60);

                    //Create four
                    for(int j=0;j<tncsub_List_Array.getTncsub_list().size();j++)
                    {
                        // Create LinearLayout
                        LinearLayout ll = new LinearLayout(Qyotation_Activity.this);
                        ll.setOrientation(LinearLayout.HORIZONTAL);

                        TextView product1 = new TextView(Qyotation_Activity.this);
                        product1.setText(" "+j+") ");
                        product1.setLayoutParams(params);
                        ll.addView(product1);
                        // Create TextView
                        TextView product = new TextView(Qyotation_Activity.this);
                        product.setText(" "+tncsub_List_Array.getTncsub_list().get(j).getTNC_Desc());
                        product.setLayoutParams(params);
                        ll.addView(product);


                        final ImageView imageView = new ImageView(Qyotation_Activity.this);
                        imageView.setImageDrawable(ContextCompat.getDrawable(Qyotation_Activity.this, R.drawable.tick_box));
                        imageView.setLayoutParams(params1);
                        ll.addView(imageView);
                        ll.setId(j+1);

                        final int index = j;
                        // Set click listener for button
                        ll.setOnClickListener(new View.OnClickListener() {
                            public void onClick(View v) {

                                Log.i("TAG", "index :" + index);

                                Toast.makeText(getApplicationContext(),
                                        "Clicked Button Index :" + index,
                                        Toast.LENGTH_LONG).show();

                            }
                        });


                        //Add button to LinearLayout defined in XML
                        main_t_c.addView(ll);
                    }
//                    ListView listView = (ListView) dialogterm.findViewById(R.id.listview);
//                    listView.setChoiceMode(ListView.CHOICE_MODE_MULTIPLE);
//
//
//                    customAdapter = new CustomAdapter(Qyotation_Activity.this, PrefUtils.get_tncsub_List_Array(Qyotation_Activity.this).getTncsub_list());
//                    listView.setAdapter(customAdapter);


                    button.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {

                            selectedItems.clear();
                            tNCSub_list_array = PrefUtils.get_tncsub_List_Array(Qyotation_Activity.this);

                            for (int i = 0; i < tNCSub_list_array.getTncsub_list().size(); i++) {
                                if (tNCSub_list_array.getTncsub_list().get(i).getTNCflag().equalsIgnoreCase("1")) {


                                    selectedItems.add(PrefUtils.get_tncsub_List_Array(Qyotation_Activity.this).getTncsub_list().get(i).getTNC_Desc());
                                }
                            }


                            dialogterm.dismiss();

                            //  tNCSub_list_array = PrefUtils.get_tncsub_List_Array(Qyotation_Activity.this);
                            Toast.makeText(Qyotation_Activity.this, "Selected: " + selectedItems.size(), Toast.LENGTH_SHORT).show();
                        }
                    });
                    dialogterm.show();
                }
            }
        });


        add_item_ly = (FrameLayout) findViewById(R.id.add_item_ly);
        add_item_ly.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {


                if (PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this) == null) {

                    Add_Item_by_customer();

                } else {

                    Add_Item_List();

                }


            }
        });


        txt_ap_take = (TextView) findViewById(R.id.txt_ap_take);
        ap_take_ly = (FrameLayout) findViewById(R.id.ap_take_ly);
        ap_take_ly.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                dialogcat = new Dialog(Qyotation_Activity.this);
                dialogcat.requestWindowFeature(Window.FEATURE_NO_TITLE);
                dialogcat.getWindow().setBackgroundDrawable(new ColorDrawable(android.graphics.Color.TRANSPARENT));
                dialogcat.setContentView(R.layout.dialog_emp_listcat);

                ListView lis_emp = (ListView) dialogcat.findViewById(R.id.lis_emp);

                Emp_List_Array emp_list_array = PrefUtils.get_emp_list_array(Qyotation_Activity.this);

                Adapter_emp adapter_emp = new Adapter_emp(Qyotation_Activity.this, emp_list_array.getEmp_listarray());
                lis_emp.setAdapter(adapter_emp);
                lis_emp.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                    @Override
                    public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {

                        Emp_List_Array emp_list_array = PrefUtils.get_emp_list_array(Qyotation_Activity.this);

                        txt_ap_take.setText("" + emp_list_array.getEmp_listarray().get(i).getEmpName());
                        //  Toast.makeText(Inquire_Activity.this, ""+state_list_array.getStateArrayList().get(i).getStateName(), Toast.LENGTH_LONG).show();

                        ap_take_ID = "" + emp_list_array.getEmp_listarray().get(i).getEmpID();
                        dialogcat.dismiss();

                    }
                });

                dialogcat.show();

            }
        });

        txt_allocated = (TextView) findViewById(R.id.txt_allocated);
        allocated_ly = (FrameLayout) findViewById(R.id.allocated_ly);
        allocated_ly.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                dialogcat = new Dialog(Qyotation_Activity.this);
                dialogcat.requestWindowFeature(Window.FEATURE_NO_TITLE);
                dialogcat.getWindow().setBackgroundDrawable(new ColorDrawable(android.graphics.Color.TRANSPARENT));
                dialogcat.setContentView(R.layout.dialog_emp_listcat);

                ListView lis_emp = (ListView) dialogcat.findViewById(R.id.lis_emp);

                Emp_List_Array emp_list_array = PrefUtils.get_emp_list_array(Qyotation_Activity.this);

                Adapter_emp adapter_emp = new Adapter_emp(Qyotation_Activity.this, emp_list_array.getEmp_listarray());
                lis_emp.setAdapter(adapter_emp);
                lis_emp.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                    @Override
                    public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {

                        Emp_List_Array emp_list_array = PrefUtils.get_emp_list_array(Qyotation_Activity.this);
                        txt_allocated.setText("" + emp_list_array.getEmp_listarray().get(i).getEmpName());

                        allocated_ID = "" + emp_list_array.getEmp_listarray().get(i).getEmpID();
                        dialogcat.dismiss();

                    }
                });

                dialogcat.show();

            }
        });


        txt_subject = (EditText) findViewById(R.id.txt_subject);
        txt_mob_no = (EditText) findViewById(R.id.txt_mob_no);
        txt_address = (EditText) findViewById(R.id.txt_address);
        txt_email = (EditText) findViewById(R.id.txt_email);
        txt_con_per = (EditText) findViewById(R.id.txt_con_per);
        txt_refer = (EditText) findViewById(R.id.txt_refer);
        txt_c_name = (TextView) findViewById(R.id.txt_c_name);
        txt_Remarks = (EditText) findViewById(R.id.txt_Remarks);


        c_name_l = (FrameLayout) findViewById(R.id.c_name_l);
        c_name_l.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                dialogcat = new Dialog(Qyotation_Activity.this);
                dialogcat.requestWindowFeature(Window.FEATURE_NO_TITLE);
                dialogcat.getWindow().setBackgroundDrawable(new ColorDrawable(android.graphics.Color.TRANSPARENT));
                dialogcat.setContentView(R.layout.dialog_customer_listcat);

                ListView lis_emp = (ListView) dialogcat.findViewById(R.id.lis_customer);

                Customer_List_Array customer_list_array = PrefUtils.get_customer_list_array(Qyotation_Activity.this);

                Adapter_customer adapter_customer = new Adapter_customer(Qyotation_Activity.this, customer_list_array.getCustomer_List());
                lis_emp.setAdapter(adapter_customer);
                lis_emp.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                    @Override
                    public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {

                        Customer_List_Array customer_list_array = PrefUtils.get_customer_list_array(Qyotation_Activity.this);

                        txt_c_name.setText("" + customer_list_array.getCustomer_List().get(i).getCustomerName());
                        c_name_ID = "" + customer_list_array.getCustomer_List().get(i).getCustomerID();


                        txt_con_per.setText("" + customer_list_array.getCustomer_List().get(i).getContactPerson());


                        txt_email.setText("" + customer_list_array.getCustomer_List().get(i).getEMAIL());


                        txt_mob_no.setText("" + customer_list_array.getCustomer_List().get(i).getMobile());


                        txt_address.setText("" + customer_list_array.getCustomer_List().get(i).getAddress());

                        ap_take_ID = "" + customer_list_array.getCustomer_List().get(i).getEmpID();
                        allocated_ID = "" + customer_list_array.getCustomer_List().get(i).getAllocatedToEmpID();

                        dialogcat.dismiss();

                        Call();

                    }
                });

                dialogcat.show();

            }
        });


        txt_category = (EditText) findViewById(R.id.txt_category);
        category_ly = (LinearLayout) findViewById(R.id.category_ly);
        category_ly.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {


                if (PrefUtils.get_category_list_array(Qyotation_Activity.this) == null) {

                    Toast.makeText(Qyotation_Activity.this, "No Category !", Toast.LENGTH_LONG).show();

                } else {
                    dialogcat = new Dialog(Qyotation_Activity.this);
                    dialogcat.requestWindowFeature(Window.FEATURE_NO_TITLE);
                    dialogcat.getWindow().setBackgroundDrawable(new ColorDrawable(android.graphics.Color.TRANSPARENT));
                    dialogcat.setContentView(R.layout.dialog_category);

                    ListView lis_emp = (ListView) dialogcat.findViewById(R.id.lis_emp);

                    Category_List_Array category_list_array = PrefUtils.get_category_list_array(Qyotation_Activity.this);

                    Adapter_Category adapter_inqr = new Adapter_Category(Qyotation_Activity.this, category_list_array.getCategory_List());
                    lis_emp.setAdapter(adapter_inqr);
                    lis_emp.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                        @Override
                        public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {

                            Category_List_Array category_list_array = PrefUtils.get_category_list_array(Qyotation_Activity.this);
                            txt_category.setText("" + category_list_array.getCategory_List().get(i).getCategory());
                            //  Toast.makeText(Inquire_edit_Activity.this, ""+state_list_array.getStateArrayList().get(i).getStateName(), Toast.LENGTH_LONG).show();

                            //area_ID = "" + area_list_array.getArea_List().get(i).getAreaID();
                            dialogcat.dismiss();

                        }
                    });

                    dialogcat.show();

                }

            }
        });


        sent_email = (FrameLayout) findViewById(R.id.sent_email);
        email_sent = (CheckBox) findViewById(R.id.email_sent);
        sent_email.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                if (y.equalsIgnoreCase("0")) {

                    email_sent.setChecked(true);
                    y = "1";

                    //  Toast.makeText(Qyotation_Activity.this, y, Toast.LENGTH_SHORT).show();
                } else {
                    email_sent.setChecked(false);
                    y = "0";
                    //Toast.makeText(Qyotation_Activity.this, y, Toast.LENGTH_SHORT).show();
                }


            }
        });

        btn_Submit_qu.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                f_inq_date = inq_date.getText().toString();
                f_txt_c_name = txt_c_name.getText().toString();
                f_txt_con_per = txt_con_per.getText().toString();
                f_txt_address = txt_address.getText().toString();
                f_txt_email = txt_email.getText().toString();
                f_txt_mob_no = txt_mob_no.getText().toString();
                f_txt_refer = txt_refer.getText().toString();
                f_txt_category = txt_category.getText().toString();
                f_txt_subject = txt_subject.getText().toString();
                f_txt_ap_take = txt_ap_take.getText().toString();
                f_txt_allocated = txt_allocated.getText().toString();
                f_txt_total_Ammount = txt_total_Ammount.getText().toString();
                f_txt_Remarks = txt_Remarks.getText().toString();

                int nf = Math.round(Float.parseFloat(f_txt_total_Ammount));
                System.out.print(nf);

                return_val_in_english = EnglishNumberToWords.convert(nf);

                if (f_txt_c_name.equalsIgnoreCase(null) || f_txt_c_name.equalsIgnoreCase("")) {

                    Toast.makeText(Qyotation_Activity.this, "Select Customer", Toast.LENGTH_SHORT).show();

                } else if (PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this) == null) {

                    Toast.makeText(Qyotation_Activity.this, "Select at least One Item", Toast.LENGTH_SHORT).show();

                } else {


                    if (y.equalsIgnoreCase("1")) {


                        final ProgressDialog dialog = new ProgressDialog(Qyotation_Activity.this);
                        dialog.setTitle("Please wait");
                        dialog.setMessage("Preparing resources...");
                        dialog.setCancelable(false);
                        dialog.show();
                        Handler handler = new Handler();
                        handler.postDelayed(new Runnable() {
                            public void run() {
                                dialog.dismiss();
                                Intent intent = new Intent(getApplicationContext(), Quotation_List_Activity.class);
                                startActivity(intent);
                            }
                        }, 60000);


                        try {
                            createPdfWrapper();
                        } catch (FileNotFoundException e) {
                            e.printStackTrace();
                        } catch (DocumentException e) {
                            e.printStackTrace();
                        }


                    } else {

                        final ProgressDialog dialog = new ProgressDialog(Qyotation_Activity.this);
                        dialog.setTitle("Please wait");
                        dialog.setMessage("Preparing resources...");
                        dialog.setCancelable(false);
                        dialog.show();
                        Handler handler = new Handler();
                        handler.postDelayed(new Runnable() {
                            public void run() {
                                dialog.dismiss();
                            }
                        }, 60000);


                        ADD_Item();
                    }


                }


            }
        });


        get_Categry();
    }

    private void Add_Item_List() {

        dialogshowlist = new Dialog(Qyotation_Activity.this);
        dialogshowlist.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialogshowlist.getWindow().setBackgroundDrawable(new ColorDrawable(android.graphics.Color.TRANSPARENT));
        dialogshowlist.setContentView(R.layout.dialog_item_add_listcat);

        FrameLayout add_itemm = (FrameLayout) dialogshowlist.findViewById(R.id.add_itemm);
        add_itemm.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                dialogshowlist.dismiss();
                Add_Item_by_customer();
            }
        });

        ListView item_list_show = (ListView) dialogshowlist.findViewById(R.id.item_list_show);
        Coust_Item_List_Array coust_item_list_srray = PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this);
        Adapter_ItemAdd adapter_itemAdd = new Adapter_ItemAdd(Qyotation_Activity.this, coust_item_list_srray.getCoust_item_list());
        item_list_show.setAdapter(adapter_itemAdd);
        dialogshowlist.show();


        Total_amount();


    }

    private void Total_amount() {

        Float total_f = Float.parseFloat("0.00");

        if (PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this) != null) {

            for (int u = 0; u < PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this).getCoust_item_list().size(); u++) {

                Coust_Item_List Coust_Item_List = PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this).getCoust_item_list().get(u);


                Float SGST_f = Float.parseFloat(Coust_Item_List.getF_txt_net_ammount2());
                total_f = (total_f + SGST_f);


            }

        }


        Float total_f1 = Float.parseFloat("0.00");

        if (PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this) != null) {

            for (int u = 0; u < PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this).getCoust_item_list().size(); u++) {

                Coust_Item_List Coust_Item_List = PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this).getCoust_item_list().get(u);


                Float SGST_f1 = Float.parseFloat(Coust_Item_List.getF_txt_net_amount());
                total_f1 = (total_f1 + SGST_f1);


            }

        }


        Float total_f2 = Float.parseFloat("0.00");

        if (PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this) != null) {

            for (int u = 0; u < PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this).getCoust_item_list().size(); u++) {

                Coust_Item_List Coust_Item_List = PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this).getCoust_item_list().get(u);


                Float SGST_f2 = Float.parseFloat(Coust_Item_List.getF_txt_cgst());
                total_f2 = (total_f2 + SGST_f2);


            }

        }

        f_total_cgst = "" + total_f2;


        Float total_f3 = Float.parseFloat("0.00");

        if (PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this) != null) {

            for (int u = 0; u < PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this).getCoust_item_list().size(); u++) {

                Coust_Item_List Coust_Item_List = PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this).getCoust_item_list().get(u);


                Float SGST_f3 = Float.parseFloat(Coust_Item_List.getF_txt_sgst());
                total_f3 = (total_f3 + SGST_f3);


            }

        }


        f_total_sgst = "" + total_f3;

        f_total_net_amount = "" + total_f1;

        txt_total_Ammount.setText("" + total_f);


        Float total_f_amount = Float.parseFloat("0.00");

        if (PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this) != null) {

            for (int u = 0; u < PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this).getCoust_item_list().size(); u++) {

                Coust_Item_List Coust_Item_List = PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this).getCoust_item_list().get(u);


                Float total_f_amount1 = Float.parseFloat(Coust_Item_List.getF_txt_amount());
                total_f_amount = (total_f_amount + total_f_amount1);


            }

        }

        f_total_f_amount = "" + total_f_amount;
    }

    private void Add_Item_by_customer() {


        dialogcat = new Dialog(Qyotation_Activity.this);
        dialogcat.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialogcat.getWindow().setBackgroundDrawable(new ColorDrawable(android.graphics.Color.TRANSPARENT));
        dialogcat.setContentView(R.layout.activity_item);


        final TextView txt_item = (TextView) dialogcat.findViewById(R.id.txt_item);
        final EditText txt_qty = (EditText) dialogcat.findViewById(R.id.txt_qty);
        final TextView txt_umo = (TextView) dialogcat.findViewById(R.id.txt_umo);
        final EditText txt_rate = (EditText) dialogcat.findViewById(R.id.txt_rate);
        final TextView txt_currence = (TextView) dialogcat.findViewById(R.id.txt_currence);
        txt_net_amount = (TextView) dialogcat.findViewById(R.id.txt_net_amount);
        txt_amount = (TextView) dialogcat.findViewById(R.id.txt_amount);
        txt_discount = (TextView) dialogcat.findViewById(R.id.txt_discount);
        txt_item_desc = (EditText) dialogcat.findViewById(R.id.txt_item_desc);

        txt_net_ammount2 = (TextView) dialogcat.findViewById(R.id.txt_net_ammount2);
        txt_sgst_per = (TextView) dialogcat.findViewById(R.id.txt_sgst_per);
        txt_cgst_per = (TextView) dialogcat.findViewById(R.id.txt_cgst_per);
        txt_igst_per = (TextView) dialogcat.findViewById(R.id.txt_igst_per);
        btn_Submit = (LinearLayout) dialogcat.findViewById(R.id.btn_Submit);

        txt_sgst = (TextView) dialogcat.findViewById(R.id.txt_sgst);
        txt_cgst = (TextView) dialogcat.findViewById(R.id.txt_cgst);
        txt_igst = (TextView) dialogcat.findViewById(R.id.txt_igst);

        txt_tclass = (TextView) dialogcat.findViewById(R.id.txt_tclass);
        tclass_ly = (FrameLayout) dialogcat.findViewById(R.id.tclass_ly);
        tclass_ly.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                dialogcat134 = new Dialog(Qyotation_Activity.this);
                dialogcat134.requestWindowFeature(Window.FEATURE_NO_TITLE);
                dialogcat134.getWindow().setBackgroundDrawable(new ColorDrawable(android.graphics.Color.TRANSPARENT));
                dialogcat134.setContentView(R.layout.dialog_text_list);

                ListView lis_text = (ListView) dialogcat134.findViewById(R.id.lis_text);

                Text_class_List_Array text_class_list_array = PrefUtils.get_text_list_array(Qyotation_Activity.this);

                Adapter_text_class adapter_text_class = new Adapter_text_class(Qyotation_Activity.this, text_class_list_array.getText_class_list());
                lis_text.setAdapter(adapter_text_class);
                lis_text.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                    @Override
                    public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {

                        Text_class_List_Array text_class_list_array = PrefUtils.get_text_list_array(Qyotation_Activity.this);

                        txt_tclass.setText("" + text_class_list_array.getText_class_list().get(i).getTaxClass());
                        txt_tclass.setTag("" + text_class_list_array.getText_class_list().get(i).getTaxClassID());


                        tclass_ID = "" + text_class_list_array.getText_class_list().get(i).getTaxClassID();

                        dialogcat134.dismiss();
                        get_Tax();

                    }
                });


                dialogcat134.show();

            }
        });


        txt_qty.setOnFocusChangeListener(new View.OnFocusChangeListener() {
            @Override
            public void onFocusChange(View v, boolean hasFocus) {
                if (!hasFocus) {

                    if (txt_qty.getText().toString().length() > 0) {

                        txt_qty_t = Float.parseFloat(txt_qty.getText().toString());

                        if (txt_rate.getText().toString().length() <= 0) {

                            txt_rate_t1 = Float.parseFloat("0");
                        } else {

                            txt_rate_t1 = Float.parseFloat(txt_rate.getText().toString());

                        }

                        if (txt_discount.getText().toString().length() <= 0) {

                            txt_discount_f = Float.parseFloat("0");
                        } else {

                            txt_discount_f = Float.parseFloat(txt_discount.getText().toString());
                        }


                        call();
                    }
                    // Toast.makeText(Qyotation_Activity.this,""+(t*t1),Toast.LENGTH_SHORT).show();
                }
            }
        });


        txt_rate.setOnFocusChangeListener(new View.OnFocusChangeListener() {
            @Override
            public void onFocusChange(View v, boolean hasFocus) {
                if (!hasFocus) {

                    if (!txt_rate.getText().toString().equalsIgnoreCase(null)) {


                        if (txt_qty.getText().length() <= 0) {

                            txt_qty_t = Float.parseFloat("0");
                        } else {

                            txt_qty_t = Float.parseFloat(txt_qty.getText().toString());
                        }


                        if (txt_discount.getText().length() <= 0) {

                            txt_discount_f = Float.parseFloat("0");
                        } else {

                            txt_discount_f = Float.parseFloat(txt_discount.getText().toString());
                        }


                        txt_rate_t1 = Float.parseFloat(txt_rate.getText().toString());


                        call();
                    }
                    // Toast.makeText(Qyotation_Activity.this,""+(t*t1),Toast.LENGTH_SHORT).show();
                }
            }
        });

///////////////////////////////////////////////////////////////////////////==================================
        txt_discount.setOnFocusChangeListener(new View.OnFocusChangeListener() {
            @Override
            public void onFocusChange(View v, boolean hasFocus) {
                if (!hasFocus) {

                    if (!txt_discount.getText().toString().equalsIgnoreCase(null)) {

                        txt_discount_f = Float.parseFloat(txt_discount.getText().toString());

                        if (txt_qty.getText().length() <= 0) {

                            txt_qty_t = Float.parseFloat("0");
                        } else {

                            txt_qty_t = Float.parseFloat(txt_qty.getText().toString());
                        }


                        if (txt_rate.getText().length() <= 0) {

                            txt_rate_t1 = Float.parseFloat("0");
                        } else {

                            txt_rate_t1 = Float.parseFloat(txt_rate.getText().toString());

                        }


                        call();

                    }


                }
            }
        });
/////////////////////////////////////////////////////////////////////////======================================

        FrameLayout ap_item_ly = (FrameLayout) dialogcat.findViewById(R.id.ap_item_ly);
        ap_item_ly.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {


                dialog_item = new Dialog(Qyotation_Activity.this);
                dialog_item.requestWindowFeature(Window.FEATURE_NO_TITLE);
                dialog_item.getWindow().setBackgroundDrawable(new ColorDrawable(android.graphics.Color.TRANSPARENT));
                dialog_item.setContentView(R.layout.dialog_items_listcat);

                ListView lis_item = (ListView) dialog_item.findViewById(R.id.lis_item);


                Item_List_Array item_list_array = PrefUtils.get_item_list_array(Qyotation_Activity.this);

                Adapter_Item adapter_emp = new Adapter_Item(Qyotation_Activity.this, item_list_array.getItem_List());
                lis_item.setAdapter(adapter_emp);
                lis_item.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                    @Override
                    public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {


                        Item_List_Array item_list_array = PrefUtils.get_item_list_array(Qyotation_Activity.this);

                        txt_item.setText(item_list_array.getItem_List().get(i).getITEMNAME());
                        txt_item.setTag(item_list_array.getItem_List().get(i).getItemID());


                        txt_item_desc.setText(item_list_array.getItem_List().get(i).getSpecification());
                        txt_item_desc.setTag(item_list_array.getItem_List().get(i).getGodown());

                        txt_qty.setText("0.00");

                        txt_umo.setText(item_list_array.getItem_List().get(i).getUOM());
                        txt_rate.setText(item_list_array.getItem_List().get(i).getPrice());
                        txt_currence.setText(item_list_array.getItem_List().get(i).getCurrency());

                        dialog_item.dismiss();

                    }
                });

                dialog_item.show();
            }
        });


        btn_Submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                String f_txt_item, f_txt_qty, f_txt_umo, f_txt_rate, f_txt_currence, f_txt_amount, f_txt_discount, f_txt_net_amount;
                String f_txt_sgst, f_txt_cgst, f_txt_igst, f_txt_net_ammount2, f_txt_item_desc, f_txt_tclass, f_txt_Item_id, f_txt_godown;
                String f_txt_sgst_per, f_txt_cgst_per, f_txt_igst_per;


                f_txt_item = txt_item.getText().toString();
                f_txt_qty = txt_qty.getText().toString();
                f_txt_umo = txt_umo.getText().toString();
                f_txt_rate = txt_rate.getText().toString();
                f_txt_currence = txt_currence.getText().toString();
                f_txt_amount = txt_amount.getText().toString();
                f_txt_discount = txt_discount.getText().toString();
                f_txt_net_amount = txt_net_amount.getText().toString();
                f_txt_sgst = txt_sgst.getText().toString();
                f_txt_cgst = txt_cgst.getText().toString();
                f_txt_igst = txt_igst.getText().toString();
                f_txt_net_ammount2 = txt_net_ammount2.getText().toString();
                f_txt_item_desc = txt_item_desc.getText().toString();
                f_txt_tclass = txt_tclass.getTag().toString();
                f_txt_godown = txt_item_desc.getTag().toString();

                f_txt_Item_id = txt_item.getTag().toString();


                f_txt_sgst_per = txt_sgst_per.getText().toString();
                f_txt_cgst_per = txt_cgst_per.getText().toString();
                f_txt_igst_per = txt_igst_per.getText().toString();


                Log.e("OK", "" + f_txt_item + "" + f_txt_qty + "" + f_txt_umo + "" + f_txt_rate + "" + f_txt_currence + "" + f_txt_amount + "" + f_txt_discount + "" + f_txt_net_amount + "" + f_txt_sgst + "" + f_txt_cgst + "" + f_txt_igst + "" + f_txt_net_ammount2 + "" + f_txt_item_desc);


                if (PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this) != null) {

                    Coust_Item_List_Array coust_item_list_srray = PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this);
                    Coust_Item_List coust_item_list = new Coust_Item_List(f_txt_item, f_txt_qty, f_txt_umo, f_txt_rate, f_txt_currence, f_txt_amount, f_txt_discount, f_txt_net_amount, f_txt_sgst, f_txt_cgst, f_txt_igst, f_txt_net_ammount2, f_txt_item_desc, f_txt_tclass, f_txt_Item_id, f_txt_godown, f_txt_sgst_per, f_txt_cgst_per, f_txt_igst_per);
                    coust_item_list_srray.getCoust_item_list().add(coust_item_list);
                    PrefUtils.set_coust_item_list_srray(coust_item_list_srray, Qyotation_Activity.this);
                    dialog_item.dismiss();
                    Add_Item_List();
                    // Log.e("Total Item Count ",""+PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this).getCoust_item_list().size());

                } else {

                    Coust_Item_List_Array coust_item_list_srray = new Coust_Item_List_Array();
                    coust_item_list_srray.coust_item_list = new ArrayList<Coust_Item_List>();
                    Coust_Item_List coust_item_list = new Coust_Item_List(f_txt_item, f_txt_qty, f_txt_umo, f_txt_rate, f_txt_currence, f_txt_amount, f_txt_discount, f_txt_net_amount, f_txt_sgst, f_txt_cgst, f_txt_igst, f_txt_net_ammount2, f_txt_item_desc, f_txt_tclass, f_txt_Item_id, f_txt_godown, f_txt_sgst_per, f_txt_cgst_per, f_txt_igst_per);
                    coust_item_list_srray.coust_item_list.add(coust_item_list);
                    PrefUtils.set_coust_item_list_srray(coust_item_list_srray, Qyotation_Activity.this);
                    dialog_item.dismiss();
                    Add_Item_List();

                }


                dialogcat.dismiss();


            }
        });


        dialogcat.show();


    }

    private void Call() {

        //  Toast.makeText(Qyotation_Activity.this, "HI", Toast.LENGTH_SHORT).show();
        if (PrefUtils.get_emp_list_array(Qyotation_Activity.this) != null) {

            Emp_List_Array emp_list_array = PrefUtils.get_emp_list_array(Qyotation_Activity.this);

            for (int i5 = 0; i5 < emp_list_array.getEmp_listarray().size(); i5++) {


                if (ap_take_ID.equalsIgnoreCase(emp_list_array.getEmp_listarray().get(i5).getEmpID())) {

                    txt_ap_take.setText(emp_list_array.getEmp_listarray().get(i5).getEmpName());
                    break;
                }
            }

        }


        if (PrefUtils.get_emp_list_array(Qyotation_Activity.this) != null) {

            Emp_List_Array emp_list_array = PrefUtils.get_emp_list_array(Qyotation_Activity.this);

            for (int i5 = 0; i5 < emp_list_array.getEmp_listarray().size(); i5++) {


                if (allocated_ID.equalsIgnoreCase(emp_list_array.getEmp_listarray().get(i5).getEmpID())) {

                    txt_allocated.setText(emp_list_array.getEmp_listarray().get(i5).getEmpName());
                    break;
                }
            }

        }

    }


    private void showDatePickerDialog() {
        if (fragment == null) {
            fragment = new DatePickerFragment4();
        }
        fragment.show(getSupportFragmentManager(), "datePicker");
    }

    public void onDateSet(int year, int month, int day) {

        if (Date_s.equalsIgnoreCase("1")) {

            f_date = "" + (month + 1) + "/" + day + "/" + year;
            inq_date.setText("" + (month + 1) + "/" + day + "/" + year);
        } else {

            next_date.setText("" + (month + 1) + "/" + day + "/" + year);
            f_next_date = "" + (month + 1) + "/" + day + "/" + year;
        }

    }


    public class Adapter_emp extends BaseAdapter {

        ArrayList<Emp_List> result;
        Context context;

        private LayoutInflater inflater = null;

        public Adapter_emp(Qyotation_Activity qyotation_activity, ArrayList<Emp_List> emp_listarray) {
            // TODO Auto-generated constructor stub
            result = emp_listarray;
            context = qyotation_activity;

        }

        /*private view holder class*/
        private class ViewHolder {

            TextView cat_name;


        }

        public View getView(int position, View convertView, ViewGroup parent) {
            Adapter_emp.ViewHolder holder = null;

            LayoutInflater mInflater = (LayoutInflater)
                    context.getSystemService(Activity.LAYOUT_INFLATER_SERVICE);
            if (convertView == null) {
                convertView = mInflater.inflate(R.layout.city_items_listview, null);
                holder = new Adapter_emp.ViewHolder();

                holder.cat_name = (TextView) convertView.findViewById(R.id.cat_name);

                convertView.setTag(holder);
            } else {
                holder = (Adapter_emp.ViewHolder) convertView.getTag();
            }

            //final Sedullist rowItem = (Sedullist) getItem(position);


            holder.cat_name.setText(result.get(position).getEmpName());


            return convertView;
        }

        @Override
        public int getCount() {
            return result.size();
        }

        @Override
        public Object getItem(int position) {
            return result.get(position);
        }

        @Override
        public long getItemId(int position) {
            return result.indexOf(getItem(position));
        }
    }


    public class Adapter_Item extends BaseAdapter {

        ArrayList<Item_List> result;
        Context context;

        private LayoutInflater inflater = null;

        public Adapter_Item(Qyotation_Activity qyotation_activity, ArrayList<Item_List> item_list) {
            // TODO Auto-generated constructor stub
            result = item_list;
            context = qyotation_activity;

        }

        /*private view holder class*/
        private class ViewHolder {

            TextView txt_item_name, txt_item_Code;


        }

        public View getView(int position, View convertView, ViewGroup parent) {
            Adapter_Item.ViewHolder holder = null;

            LayoutInflater mInflater = (LayoutInflater)
                    context.getSystemService(Activity.LAYOUT_INFLATER_SERVICE);
            if (convertView == null) {
                convertView = mInflater.inflate(R.layout.items_row_listview, null);
                holder = new Adapter_Item.ViewHolder();

                holder.txt_item_name = (TextView) convertView.findViewById(R.id.txt_item_name);
                holder.txt_item_Code = (TextView) convertView.findViewById(R.id.txt_item_Code);

                convertView.setTag(holder);
            } else {
                holder = (Adapter_Item.ViewHolder) convertView.getTag();
            }

            //final Sedullist rowItem = (Sedullist) getItem(position);


            holder.txt_item_name.setText(result.get(position).getITEMNAME());
            holder.txt_item_Code.setText(result.get(position).getiCode());


            return convertView;
        }

        @Override
        public int getCount() {
            return result.size();
        }

        @Override
        public Object getItem(int position) {
            return result.get(position);
        }

        @Override
        public long getItemId(int position) {
            return result.indexOf(getItem(position));
        }
    }

    private void get_customer() {

        PrefUtils.clear_customer_list_array(Qyotation_Activity.this);
        RestAdapter adapter = new RestAdapter.Builder().setEndpoint(RetrfitInterface.url).build();

        try {
//            loading = new ProgressDialog(Qyotation_Activity.this);
//            loading.setMessage("Please Wait Loading data ....");
//            loading.show();
//            loading.setCancelable(false);

        } catch (Exception e) {

        }

        //Creating Rest Services
        final RetrfitInterface restInterface = adapter.create(RetrfitInterface.class);
        Log.d("status&&&", "stat1" + restInterface);


        restInterface.Get_customerSelect(compID, userID, new Callback<Response>()

        {

            @Override
            public void success(Response findChildArray, Response response) {

                Log.e("status", new String(((TypedByteArray) findChildArray.getBody()).getBytes()));

                String result = new String(((TypedByteArray) findChildArray.getBody()).getBytes());

                JSONArray jObj = null;
                try {
                    jObj = new JSONArray(result);

                    Log.e("Size", "" + jObj.length());
                    if (jObj.length() > 0) {
                        // loading.dismiss();

                        for (int i = 0; i < jObj.length(); i++) {

                            JSONObject jsonObj = jObj.getJSONObject(i);

                            String CustomerCode = jsonObj.getString("CustomerCode");
                            String CustomerName = jsonObj.getString("CustomerName");
                            String ContactPerson = jsonObj.getString("ContactPerson");
                            String Mobile = jsonObj.getString("Mobile");
                            String EMAIL = jsonObj.getString("EMAIL");
                            String LeadDate = jsonObj.getString("LeadDate");
                            String Phone1 = jsonObj.getString("Phone1");
                            String CustomerID = jsonObj.getString("CustomerID");
                            String Address = jsonObj.getString("Address");
                            String EmpID = jsonObj.getString("EmpID");
                            String Category = jsonObj.getString("Category");
                            String AllocatedToEmpID = jsonObj.getString("AllocatedToEmpID");
                            String CompId = jsonObj.getString("CompId");


                            if (PrefUtils.get_customer_list_array(Qyotation_Activity.this) != null) {

                                Customer_List_Array customer_list_array = PrefUtils.get_customer_list_array(Qyotation_Activity.this);
                                Customer_List customer_list = new Customer_List(CustomerCode, CustomerName, ContactPerson, Mobile, EMAIL, LeadDate, Phone1, CustomerID, Address, EmpID, Category, AllocatedToEmpID, CompId);
                                customer_list_array.getCustomer_List().add(customer_list);
                                PrefUtils.set_customer_list_array(customer_list_array, Qyotation_Activity.this);

                            } else {

                                Customer_List_Array emp_list_array = new Customer_List_Array();
                                emp_list_array.customer_List = new ArrayList<Customer_List>();
                                Customer_List customer_list = new Customer_List(CustomerCode, CustomerName, ContactPerson, Mobile, EMAIL, LeadDate, Phone1, CustomerID, Address, EmpID, Category, AllocatedToEmpID, CompId);
                                emp_list_array.customer_List.add(customer_list);
                                PrefUtils.set_customer_list_array(emp_list_array, Qyotation_Activity.this);

                            }


                        }

                        get_Item();
                    } else {
                        loading.dismiss();

                        //   Toast.makeText(Inquire_Activity.this, "Username or Password Incorrect", Toast.LENGTH_SHORT).show();
                    }


                } catch (JSONException e) {
                    e.printStackTrace();
                }

                loading.dismiss();

            }

            @Override
            public void failure(RetrofitError error) {

                String merror = error.getMessage();
                Log.d("error", merror);
                Toast.makeText(Qyotation_Activity.this, merror, Toast.LENGTH_LONG).show();

            }
        });

    }

    private void get_Categry() {

        PrefUtils.clear_category_list_array(Qyotation_Activity.this);

        RestAdapter adapter = new RestAdapter.Builder().setEndpoint(RetrfitInterface.url).build();

        try {
            loading = new ProgressDialog(Qyotation_Activity.this);
            loading.setMessage("Please Wait Loading data ....");
            loading.show();
            loading.setCancelable(false);

        } catch (Exception e) {

        }

        //Creating Rest Services
        final RetrfitInterface restInterface = adapter.create(RetrfitInterface.class);
        Log.d("status&&&", "stat1" + restInterface);


        restInterface.Get_LoadLeadCategryList(userID, compID, new Callback<Response>()

        {

            @Override
            public void success(Response findChildArray, Response response) {

                Log.e("status", new String(((TypedByteArray) findChildArray.getBody()).getBytes()));

                String result = new String(((TypedByteArray) findChildArray.getBody()).getBytes());

                JSONArray jObj = null;
                try {
                    jObj = new JSONArray(result);

                    Log.e("Size", "" + jObj.length());
                    if (jObj.length() > 0) {
                        // loading.dismiss();

                        for (int i = 0; i < jObj.length(); i++) {

                            JSONObject jsonObj = jObj.getJSONObject(i);

                            String Category = jsonObj.getString("Category");

                            if (PrefUtils.get_category_list_array(Qyotation_Activity.this) != null) {

                                Category_List_Array category_list_array = PrefUtils.get_category_list_array(Qyotation_Activity.this);
                                Category_List category_list = new Category_List(Category);
                                category_list_array.getCategory_List().add(category_list);
                                PrefUtils.set_category_list_array(category_list_array, Qyotation_Activity.this);

                            } else {

                                Category_List_Array category_list_array = new Category_List_Array();
                                category_list_array.category_List = new ArrayList<Category_List>();
                                Category_List category_list = new Category_List(Category);
                                category_list_array.category_List.add(category_list);
                                PrefUtils.set_category_list_array(category_list_array, Qyotation_Activity.this);

                            }


                        }


                        //  State_List_Array state_list_array = PrefUtils.get_state_list_array(Inquire_edit_Activity.this);

                        //  Toast.makeText(Inquire_edit_Activity.this, ""+state_list_array.getStateArrayList().size(), Toast.LENGTH_SHORT).show();


                        get_customer();

                    } else {

                        loading.dismiss();

                        //   Toast.makeText(Inquire_edit_Activity.this, "Username or Password Incorrect", Toast.LENGTH_SHORT).show();
                    }


                } catch (JSONException e) {
                    e.printStackTrace();
                }

                loading.dismiss();

            }

            @Override
            public void failure(RetrofitError error) {

                String merror = error.getMessage();
                Log.d("error", merror);
                Toast.makeText(Qyotation_Activity.this, merror, Toast.LENGTH_LONG).show();

            }
        });

    }

    private void get_Item() {

        PrefUtils.clear_item_list_array(Qyotation_Activity.this);
        RestAdapter adapter = new RestAdapter.Builder().setEndpoint(RetrfitInterface.url).build();

        try {
//            loading = new ProgressDialog(Qyotation_Activity.this);
//            loading.setMessage("Please Wait Loading data ....");
//            loading.show();
//            loading.setCancelable(false);

        } catch (Exception e) {

        }

        //Creating Rest Services
        final RetrfitInterface restInterface = adapter.create(RetrfitInterface.class);
        Log.d("status&&&", "stat1" + restInterface);


        restInterface.Get_ItemList(compID, userID, new Callback<Response>()

        {

            @Override
            public void success(Response findChildArray, Response response) {

                Log.e("status", new String(((TypedByteArray) findChildArray.getBody()).getBytes()));

                String result = new String(((TypedByteArray) findChildArray.getBody()).getBytes());

                JSONArray jObj = null;
                try {
                    jObj = new JSONArray(result);

                    Log.e("Size", "" + jObj.length());
                    if (jObj.length() > 0) {
                        // loading.dismiss();

                        for (int i = 0; i < jObj.length(); i++) {

                            JSONObject jsonObj = jObj.getJSONObject(i);

                            String ItemID = jsonObj.getString("ItemID");
                            String iCode = jsonObj.getString("iCode");
                            String ITEMNAME = jsonObj.getString("ITEMNAME");
                            String UOMID = jsonObj.getString("UOMID");
                            String UOM = jsonObj.getString("UOM");
                            String Specification = jsonObj.getString("Specification");
                            String Price = jsonObj.getString("Price");
                            String HSNCode = jsonObj.getString("HSNCode");
                            String ProductCode = jsonObj.getString("ProductCode");
                            String DocName = jsonObj.getString("DocName");
                            String CurrencyID = jsonObj.getString("CurrencyID");
                            String CurrencyName = jsonObj.getString("CurrencyName");
                            String Currency = jsonObj.getString("Currency");
                            String Godown = jsonObj.getString("Godown");
                            String QOH = jsonObj.getString("QOH");
                            String ReorderLevel = jsonObj.getString("ReorderLevel");
                            String Location = jsonObj.getString("Location");
                            String RackNo = jsonObj.getString("RackNo");


                            if (PrefUtils.get_item_list_array(Qyotation_Activity.this) != null) {

                                Item_List_Array item_list_array = PrefUtils.get_item_list_array(Qyotation_Activity.this);
                                Item_List item_list = new Item_List(ItemID, iCode, ITEMNAME, UOMID, UOM, Specification, Price, HSNCode, ProductCode, DocName, CurrencyID, CurrencyName, Currency, Godown, QOH, ReorderLevel, Location, RackNo);
                                item_list_array.getItem_List().add(item_list);
                                PrefUtils.set_customer_list_array(item_list_array, Qyotation_Activity.this);

                            } else {

                                Item_List_Array item_list_array = new Item_List_Array();
                                item_list_array.item_List = new ArrayList<Item_List>();
                                Item_List item_list = new Item_List(ItemID, iCode, ITEMNAME, UOMID, UOM, Specification, Price, HSNCode, ProductCode, DocName, CurrencyID, CurrencyName, Currency, Godown, QOH, ReorderLevel, Location, RackNo);
                                item_list_array.item_List.add(item_list);
                                PrefUtils.set_customer_list_array(item_list_array, Qyotation_Activity.this);

                            }


                        }

                        get_TaxClassList();
                    } else {
                        loading.dismiss();

                        //   Toast.makeText(Inquire_Activity.this, "Username or Password Incorrect", Toast.LENGTH_SHORT).show();
                    }


                } catch (JSONException e) {
                    e.printStackTrace();
                }

                loading.dismiss();

            }

            @Override
            public void failure(RetrofitError error) {

                String merror = error.getMessage();
                Log.d("error", merror);
                Toast.makeText(Qyotation_Activity.this, merror, Toast.LENGTH_LONG).show();

            }
        });

    }

    private void get_TaxClassList() {

        PrefUtils.clear_text_list_array(Qyotation_Activity.this);
        RestAdapter adapter = new RestAdapter.Builder().setEndpoint(RetrfitInterface.url).build();

        try {
//            loading = new ProgressDialog(Qyotation_Activity.this);
//            loading.setMessage("Please Wait Loading data ....");
//            loading.show();
//            loading.setCancelable(false);

        } catch (Exception e) {

        }

        //Creating Rest Services
        final RetrfitInterface restInterface = adapter.create(RetrfitInterface.class);
        Log.d("status&&&", "stat1" + restInterface);


        restInterface.Get_TaxClassList(compID, userID, new Callback<Response>()

        {

            @Override
            public void success(Response findChildArray, Response response) {

                Log.e("status", new String(((TypedByteArray) findChildArray.getBody()).getBytes()));

                String result = new String(((TypedByteArray) findChildArray.getBody()).getBytes());

                JSONArray jObj = null;
                try {
                    jObj = new JSONArray(result);

                    Log.e("Size", "" + jObj.length());
                    if (jObj.length() > 0) {
                        // loading.dismiss();

                        for (int i = 0; i < jObj.length(); i++) {

                            JSONObject jsonObj = jObj.getJSONObject(i);

                            String TaxClassID = jsonObj.getString("TaxClassID");
                            String TaxClass = jsonObj.getString("TaxClass");


                            if (PrefUtils.get_text_list_array(Qyotation_Activity.this) != null) {

                                Text_class_List_Array text_class_list_array = PrefUtils.get_text_list_array(Qyotation_Activity.this);
                                Text_class_List text_class_list = new Text_class_List(TaxClassID, TaxClass);
                                text_class_list_array.getText_class_list().add(text_class_list);
                                PrefUtils.set_text_list_array(text_class_list_array, Qyotation_Activity.this);

                            } else {

                                Text_class_List_Array text_class_list_array = new Text_class_List_Array();
                                text_class_list_array.text_class_list = new ArrayList<Text_class_List>();
                                Text_class_List text_class_list = new Text_class_List(TaxClassID, TaxClass);
                                text_class_list_array.text_class_list.add(text_class_list);
                                PrefUtils.set_text_list_array(text_class_list_array, Qyotation_Activity.this);

                            }


                        }

                        //loading.dismiss();
                    } else {
                        loading.dismiss();

                        //   Toast.makeText(Inquire_Activity.this, "Username or Password Incorrect", Toast.LENGTH_SHORT).show();
                    }


                    get_Term();

                } catch (JSONException e) {
                    e.printStackTrace();
                }

                // loading.dismiss();

            }

            @Override
            public void failure(RetrofitError error) {

                String merror = error.getMessage();
                Log.d("error", merror);
                Toast.makeText(Qyotation_Activity.this, merror, Toast.LENGTH_LONG).show();

            }
        });

    }


    private void get_Term() {

        PrefUtils.clear_tncsub_List_Array(Qyotation_Activity.this);
        RestAdapter adapter = new RestAdapter.Builder().setEndpoint(RetrfitInterface.url).build();

        try {
//            loading = new ProgressDialog(Qyotation_Activity.this);
//            loading.setMessage("Please Wait Loading data ....");
//            loading.show();
//            loading.setCancelable(false);

        } catch (Exception e) {

        }

        //Creating Rest Services
        final RetrfitInterface restInterface = adapter.create(RetrfitInterface.class);
        Log.d("status&&&", "stat1" + restInterface);


        restInterface.Get_Term("QUOTATION", compID, new Callback<Response>()

        {

            @Override
            public void success(Response findChildArray, Response response) {

                Log.e("status", new String(((TypedByteArray) findChildArray.getBody()).getBytes()));

                String result = new String(((TypedByteArray) findChildArray.getBody()).getBytes());

                JSONArray jObj = null;
                try {
                    jObj = new JSONArray(result);

                    Log.e("Size", "" + jObj.length());
                    if (jObj.length() > 0) {
                        // loading.dismiss();

                        for (int i = 0; i < jObj.length(); i++) {

                            JSONObject jsonObj = jObj.getJSONObject(i);

                            String TNC_Desc = jsonObj.getString("TNC_Desc");
                            String TNCID = jsonObj.getString("TNCID");
                            String TNCflag = "0";


                            if (PrefUtils.get_tncsub_List_Array(Qyotation_Activity.this) != null) {

                                TNCSub_List_Array tncsub_List_Array = PrefUtils.get_tncsub_List_Array(Qyotation_Activity.this);
                                TNCSub_List tncsub_List = new TNCSub_List(TNC_Desc, TNCID, TNCflag);
                                tncsub_List_Array.getTncsub_list().add(tncsub_List);
                                PrefUtils.set_tncsub_List_Array(tncsub_List_Array, Qyotation_Activity.this);


                            } else {

                                TNCSub_List_Array tncsub_List_Array = new TNCSub_List_Array();
                                tncsub_List_Array.tncsub_list = new ArrayList<TNCSub_List>();
                                TNCSub_List tncsub_List = new TNCSub_List(TNC_Desc, TNCID, TNCflag);
                                tncsub_List_Array.tncsub_list.add(tncsub_List);
                                PrefUtils.set_tncsub_List_Array(tncsub_List_Array, Qyotation_Activity.this);

                            }


                        }

                        //loading.dismiss();
                    } else {
                        loading.dismiss();

                        //   Toast.makeText(Inquire_Activity.this, "Username or Password Incorrect", Toast.LENGTH_SHORT).show();
                    }

                    get_com_detail();
                } catch (JSONException e) {
                    e.printStackTrace();
                }

                loading.dismiss();

            }

            @Override
            public void failure(RetrofitError error) {

                String merror = error.getMessage();
                Log.d("error", merror);
                Toast.makeText(Qyotation_Activity.this, merror, Toast.LENGTH_LONG).show();

            }
        });

    }

    private void get_Tax() {

        //PrefUtils.clear_item_list_array(Qyotation_Activity.this);
        RestAdapter adapter = new RestAdapter.Builder().setEndpoint(RetrfitInterface.url).build();

        try {
            loading = new ProgressDialog(Qyotation_Activity.this);
            loading.setMessage("Please Wait Loading data ....");
            loading.show();
            loading.setCancelable(false);

        } catch (Exception e) {

        }

        //Creating Rest Services
        final RetrfitInterface restInterface = adapter.create(RetrfitInterface.class);
        Log.d("status&&&", "stat1" + restInterface);


        restInterface.Get_TaxClassRate(tclass_ID, new Callback<Response>()

        {

            @Override
            public void success(Response findChildArray, Response response) {

                Log.e("status", new String(((TypedByteArray) findChildArray.getBody()).getBytes()));

                String result = new String(((TypedByteArray) findChildArray.getBody()).getBytes());

                JSONArray jObj = null;
                try {
                    jObj = new JSONArray(result);

                    Log.e("Size", "" + jObj.length());
                    if (jObj.length() > 0) {
                        // loading.dismiss();

                        for (int i = 0; i < jObj.length(); i++) {

                            JSONObject jsonObj = jObj.getJSONObject(i);

                            SGST = jsonObj.getString("SGST");
                            CGST = jsonObj.getString("CGST");
                            IGST = jsonObj.getString("IGST");


                            call();


                        }

                        loading.dismiss();
                    } else {
                        loading.dismiss();

                        //   Toast.makeText(Inquire_Activity.this, "Username or Password Incorrect", Toast.LENGTH_SHORT).show();
                    }


                } catch (JSONException e) {
                    e.printStackTrace();
                }

                loading.dismiss();

            }

            @Override
            public void failure(RetrofitError error) {

                String merror = error.getMessage();
                Log.d("error", merror);
                Toast.makeText(Qyotation_Activity.this, merror, Toast.LENGTH_LONG).show();

            }
        });

    }


    private void get_com_detail() {

        PrefUtils.clear_comp_info_List_Array(Qyotation_Activity.this);
        RestAdapter adapter = new RestAdapter.Builder().setEndpoint(RetrfitInterface.url).build();

        try {
//            loading = new ProgressDialog(Qyotation_Activity.this);
//            loading.setMessage("Please Wait Loading data ....");
//            loading.show();
//            loading.setCancelable(false);

        } catch (Exception e) {

        }

        //Creating Rest Services
        final RetrfitInterface restInterface = adapter.create(RetrfitInterface.class);
        Log.d("status&&&", "stat1" + restInterface);


        restInterface.Get_com_detail(compID, new Callback<Response>()

        {

            @Override
            public void success(Response findChildArray, Response response) {

                Log.e("status", new String(((TypedByteArray) findChildArray.getBody()).getBytes()));

                String result = new String(((TypedByteArray) findChildArray.getBody()).getBytes());

                JSONArray jObj = null;
                try {
                    jObj = new JSONArray(result);

                    Log.e("Size", "" + jObj.length());
                    if (jObj.length() > 0) {
                        // loading.dismiss();

                        for (int i = 0; i < jObj.length(); i++) {

                            JSONObject jsonObj = jObj.getJSONObject(i);

                            Name1 = jsonObj.getString("Name1");
                            Name2 = jsonObj.getString("Name2");
                            Name3 = jsonObj.getString("Name3");
                            Name4 = jsonObj.getString("Name4");
                            Name5 = jsonObj.getString("Name5");
                            Name6 = jsonObj.getString("Name6");

                            Value1 = jsonObj.getString("Value1");
                            Value2 = jsonObj.getString("Value2");
                            Value3 = jsonObj.getString("Value3");
                            Value4 = jsonObj.getString("Value4");
                            Value5 = jsonObj.getString("Value5");
                            Value6 = jsonObj.getString("Value6");


                            if (PrefUtils.get_comp_info_List_Array(Qyotation_Activity.this) != null) {

                                Comp_info_List_Array comp_info_List_Array = PrefUtils.get_comp_info_List_Array(Qyotation_Activity.this);
                                Comp_info_List comp_info_List = new Comp_info_List(Name1, Name2, Name3, Name4, Name5, Name6, Value1, Value2, Value3, Value4, Value5, Value6);
                                comp_info_List_Array.getComp_info_List().add(comp_info_List);
                                PrefUtils.set_comp_info_List_Array(comp_info_List_Array, Qyotation_Activity.this);

                            } else {

                                Comp_info_List_Array comp_info_List_Array = new Comp_info_List_Array();
                                comp_info_List_Array.comp_info_List = new ArrayList<Comp_info_List>();
                                Comp_info_List comp_info_List = new Comp_info_List(Name1, Name2, Name3, Name4, Name5, Name6, Value1, Value2, Value3, Value4, Value5, Value6);
                                comp_info_List_Array.comp_info_List.add(comp_info_List);
                                PrefUtils.set_comp_info_List_Array(comp_info_List_Array, Qyotation_Activity.this);

                            }


                        }

                        loading.dismiss();
                    } else {
                        loading.dismiss();

                        //   Toast.makeText(Inquire_Activity.this, "Username or Password Incorrect", Toast.LENGTH_SHORT).show();
                    }


                } catch (JSONException e) {
                    e.printStackTrace();
                }

                loading.dismiss();

            }

            @Override
            public void failure(RetrofitError error) {

                String merror = error.getMessage();
                Log.d("error", merror);
                Toast.makeText(Qyotation_Activity.this, merror, Toast.LENGTH_LONG).show();

            }
        });

    }

    private void call() {


        txt_amount.setText("" + (txt_qty_t * txt_rate_t1));

        Float txt_amount_f = Float.parseFloat(txt_amount.getText().toString());
        Float net_pric = ((txt_amount_f * txt_discount_f) / 100);

        txt_net_amount.setText("" + (txt_amount_f - net_pric));
        txt_net_ammount2.setText("" + (txt_amount_f - net_pric));


        if (!txt_net_amount.getText().toString().equalsIgnoreCase(null)) {

            if (SGST.equalsIgnoreCase("") || SGST.equalsIgnoreCase(null)) {
            } else {

                Float SGST_f = Float.parseFloat(SGST);
                Float CGST_f = Float.parseFloat(CGST);
                Float IGST_f = Float.parseFloat(IGST);

                Float net_amount_f = Float.parseFloat(txt_net_amount.getText().toString());


                txt_sgst_per.setText("" + SGST_f);
                txt_cgst_per.setText("" + CGST_f);
                txt_igst_per.setText("" + IGST_f);

                txt_sgst = (TextView) dialogcat.findViewById(R.id.txt_sgst);
                txt_cgst = (TextView) dialogcat.findViewById(R.id.txt_cgst);
                txt_igst = (TextView) dialogcat.findViewById(R.id.txt_igst);

                txt_sgst.setText("" + (net_amount_f * SGST_f) / 100);
                txt_cgst.setText("" + (net_amount_f * CGST_f) / 100);
                txt_igst.setText("" + (net_amount_f * IGST_f) / 100);


                f__SGST = "" + SGST_f;
                f__CGST = "" + CGST_f;
                f__IGST = "" + IGST_f;


                txt_net_ammount2.setText("" + (net_amount_f + ((net_amount_f * SGST_f) / 100) + ((net_amount_f * CGST_f) / 100) + ((net_amount_f * IGST_f) / 100)));


            }

        }
    }


    public class Adapter_customer extends BaseAdapter {

        ArrayList<Customer_List> result;
        Context context;

        private LayoutInflater inflater = null;

        public Adapter_customer(Qyotation_Activity qyotation_activity, ArrayList<Customer_List> customer_list) {
            // TODO Auto-generated constructor stub
            result = customer_list;
            context = qyotation_activity;

        }

        /*private view holder class*/
        private class ViewHolder {

            TextView txt_Code, txt_c_name, txt_ContactPerson, txt_m_no, txt_email;
            LinearLayout ContactPerson_l, p_m_l, email_l;

        }

        public View getView(int position, View convertView, ViewGroup parent) {
            ViewHolder holder = null;

            LayoutInflater mInflater = (LayoutInflater)
                    context.getSystemService(Activity.LAYOUT_INFLATER_SERVICE);
            if (convertView == null) {
                convertView = mInflater.inflate(R.layout.customer_items_listview, null);
                holder = new ViewHolder();


                holder.txt_Code = (TextView) convertView.findViewById(R.id.txt_Code);
                holder.txt_c_name = (TextView) convertView.findViewById(R.id.txt_c_name);
                holder.txt_ContactPerson = (TextView) convertView.findViewById(R.id.txt_ContactPerson);
                holder.txt_m_no = (TextView) convertView.findViewById(R.id.txt_m_no);
                holder.txt_email = (TextView) convertView.findViewById(R.id.txt_email);

                holder.ContactPerson_l = (LinearLayout) convertView.findViewById(R.id.ContactPerson_l);
                holder.p_m_l = (LinearLayout) convertView.findViewById(R.id.p_m_l);
                holder.email_l = (LinearLayout) convertView.findViewById(R.id.email_l);

                convertView.setTag(holder);

            } else {

                holder = (ViewHolder) convertView.getTag();

            }


            holder.txt_Code.setText(result.get(position).getCustomerCode());
            holder.txt_c_name.setText(result.get(position).getCustomerName());

            if (result.get(position).getContactPerson().equalsIgnoreCase("") || result.get(position).getContactPerson().equalsIgnoreCase(null)) {

                holder.ContactPerson_l.setVisibility(View.GONE);

            } else {
                holder.ContactPerson_l.setVisibility(View.VISIBLE);
                holder.txt_ContactPerson.setText(result.get(position).getContactPerson());
            }


            if (result.get(position).getMobile().equalsIgnoreCase("") || result.get(position).getMobile().equalsIgnoreCase(null)) {

                holder.p_m_l.setVisibility(View.GONE);

            } else {
                holder.p_m_l.setVisibility(View.VISIBLE);
                holder.txt_m_no.setText(result.get(position).getMobile());
            }


            if (result.get(position).getEMAIL().equalsIgnoreCase("") || result.get(position).getEMAIL().equalsIgnoreCase(null)) {

                holder.email_l.setVisibility(View.GONE);

            } else {
                holder.email_l.setVisibility(View.VISIBLE);
                holder.txt_email.setText(result.get(position).getEMAIL());
            }


            return convertView;

        }

        @Override
        public int getCount() {
            return result.size();
        }

        @Override
        public Object getItem(int position) {
            return result.get(position);
        }

        @Override
        public long getItemId(int position) {
            return result.indexOf(getItem(position));
        }
    }

    public class Adapter_Category extends BaseAdapter {


        ArrayList<Category_List> result;
        Context context;

        private LayoutInflater inflater = null;

        public Adapter_Category(Qyotation_Activity mainActivity, ArrayList<Category_List> category_list) {
            // TODO Auto-generated constructor stub
            result = category_list;
            context = mainActivity;

        }


        /*private view holder class*/
        private class ViewHolder {

            TextView cat_name;


        }

        public View getView(int position, View convertView, ViewGroup parent) {
            Adapter_Category.ViewHolder holder = null;

            LayoutInflater mInflater = (LayoutInflater)
                    context.getSystemService(Activity.LAYOUT_INFLATER_SERVICE);
            if (convertView == null) {
                convertView = mInflater.inflate(R.layout.city_items_listview, null);
                holder = new Adapter_Category.ViewHolder();

                holder.cat_name = (TextView) convertView.findViewById(R.id.cat_name);

                convertView.setTag(holder);
            } else {
                holder = (Adapter_Category.ViewHolder) convertView.getTag();
            }

            //final Sedullist rowItem = (Sedullist) getItem(position);


            holder.cat_name.setText(result.get(position).getCategory());


            return convertView;
        }

        @Override
        public int getCount() {
            return result.size();
        }

        @Override
        public Object getItem(int position) {
            return result.get(position);
        }

        @Override
        public long getItemId(int position) {
            return result.indexOf(getItem(position));
        }
    }


    public class Adapter_text_class extends BaseAdapter {

        ArrayList<Text_class_List> result;
        Context context;

        private LayoutInflater inflater = null;

        public Adapter_text_class(Qyotation_Activity qyotation_activity, ArrayList<Text_class_List> text_class_list) {
            // TODO Auto-generated constructor stub
            result = text_class_list;
            context = qyotation_activity;

        }


        /*private view holder class*/
        private class ViewHolder {

            TextView txt_item;

        }

        public View getView(int position, View convertView, ViewGroup parent) {
            ViewHolder holder = null;

            LayoutInflater mInflater = (LayoutInflater)
                    context.getSystemService(Activity.LAYOUT_INFLATER_SERVICE);
            if (convertView == null) {
                convertView = mInflater.inflate(R.layout.text_row_listview, null);
                holder = new ViewHolder();


                holder.txt_item = (TextView) convertView.findViewById(R.id.txt_item);

                convertView.setTag(holder);

            } else {

                holder = (ViewHolder) convertView.getTag();

            }


            holder.txt_item.setText(result.get(position).getTaxClass());


            return convertView;

        }

        @Override
        public int getCount() {
            return result.size();
        }

        @Override
        public Object getItem(int position) {
            return result.get(position);
        }

        @Override
        public long getItemId(int position) {
            return result.indexOf(getItem(position));
        }
    }


    public class Adapter_ItemAdd extends BaseAdapter {


        ArrayList<Coust_Item_List> result;
        Context context;

        private LayoutInflater inflater = null;

        public Adapter_ItemAdd(Qyotation_Activity qyotation_activity, ArrayList<Coust_Item_List> coust_item_list) {
            // TODO Auto-generated constructor stub
            result = coust_item_list;
            context = qyotation_activity;

        }


        /*private view holder class*/
        private class ViewHolder {

            TextView cat_name;


        }

        public View getView(int position, View convertView, ViewGroup parent) {
            Adapter_ItemAdd.ViewHolder holder = null;

            LayoutInflater mInflater = (LayoutInflater)
                    context.getSystemService(Activity.LAYOUT_INFLATER_SERVICE);
            if (convertView == null) {
                convertView = mInflater.inflate(R.layout.cusadd_items_listview, null);
                holder = new Adapter_ItemAdd.ViewHolder();

                holder.cat_name = (TextView) convertView.findViewById(R.id.cat_name);

                convertView.setTag(holder);
            } else {
                holder = (Adapter_ItemAdd.ViewHolder) convertView.getTag();
            }

            //final Sedullist rowItem = (Sedullist) getItem(position);


            holder.cat_name.setText(result.get(position).getF_txt_item());


            return convertView;
        }

        @Override
        public int getCount() {
            return result.size();
        }

        @Override
        public Object getItem(int position) {
            return result.get(position);
        }

        @Override
        public long getItemId(int position) {
            return result.indexOf(getItem(position));
        }
    }


    ///--------------------------  PDF -------------------//


    private void createPdfWrapper() throws FileNotFoundException, DocumentException {

        int hasWriteStoragePermission = ActivityCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE);
        if (hasWriteStoragePermission != PackageManager.PERMISSION_GRANTED) {

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                if (!shouldShowRequestPermissionRationale(Manifest.permission.WRITE_CONTACTS)) {
                    showMessageOKCancel("You need to allow access to Storage",
                            new DialogInterface.OnClickListener() {
                                @Override
                                public void onClick(DialogInterface dialog, int which) {
                                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                                        requestPermissions(new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE},
                                                REQUEST_CODE_ASK_PERMISSIONS);
                                    }
                                }
                            });
                    return;
                }


                requestPermissions(new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE},
                        REQUEST_CODE_ASK_PERMISSIONS);
            }
            return;
        } else {

            // Toast.makeText(PdfCreatorActivity.this,"OK    1",Toast.LENGTH_LONG).show();
            createPdf();
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        switch (requestCode) {
            case REQUEST_CODE_ASK_PERMISSIONS:
                if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    // Permission Granted
                    try {

                        //Toast.makeText(PdfCreatorActivity.this,"OK    2",Toast.LENGTH_LONG).show();
                        createPdfWrapper();
                    } catch (FileNotFoundException e) {
                        e.printStackTrace();
                    } catch (DocumentException e) {
                        e.printStackTrace();
                    }
                } else {
                    // Permission Denied
                    Toast.makeText(this, "WRITE_EXTERNAL Permission Denied", Toast.LENGTH_SHORT)
                            .show();
                }
                break;
            default:
                super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }

    private void showMessageOKCancel(String message, DialogInterface.OnClickListener okListener) {
        new AlertDialog.Builder(this)
                .setMessage(message)
                .setPositiveButton("OK", okListener)
                .setNegativeButton("Cancel", null)
                .create()
                .show();
    }

    private void createPdf() throws FileNotFoundException, DocumentException {

        Comp_info_List_Array comp_info_List_Array;

        if (PrefUtils.get_comp_info_List_Array(Qyotation_Activity.this) != null) {
            comp_info_List_Array = PrefUtils.get_comp_info_List_Array(Qyotation_Activity.this);
        }

        File docsFolder = new File(Environment.getExternalStorageDirectory() + "/Documents");
        if (!docsFolder.exists()) {
            docsFolder.mkdir();
            Log.i(TAG, "Created a new directory for PDF");
        }


        pdfFile = new File(docsFolder.getAbsolutePath(), "" + "a" + ".pdf");
        OutputStream output = new FileOutputStream(pdfFile);
        Document document = new Document();
        PdfWriter.getInstance(document, output);
        document.open();

        try {
            ByteArrayOutputStream stream = new ByteArrayOutputStream();
            bmp.compress(Bitmap.CompressFormat.PNG, 100, stream);
            Image image = Image.getInstance(stream.toByteArray());
            image.setAbsolutePosition(25, 750);
            image.scalePercent(25);
            document.add(image);
        } catch (IOException ex) {
            return;
        }


        //  document.add(new Paragraph(mContentEditText.getText().toString()));
        paragraph = new Paragraph();
        addChildp(new Paragraph("", fTitle1));

        paragraph.setSpacingBefore(0);
        paragraph.setFont(fText);

        PdfPTable myTable = new PdfPTable(1);
        myTable.setWidthPercentage(100.0f);
        myTable.setSpacingBefore(10);
        PdfPCell myCell = new PdfPCell(new Paragraph("QUOTATION", fTitle));
        myCell.setHorizontalAlignment(Element.ALIGN_CENTER);
        myCell.setVerticalAlignment(Element.ALIGN_CENTER);
        myCell.setFixedHeight(40);
        myTable.addCell(myCell);

        float[] columnWidths = {2f, 1f,};
        PdfPTable pdfPTable = new PdfPTable(columnWidths);
        pdfPTable.setSpacingBefore(0);
        pdfPTable.setWidthPercentage(100);
        PdfPCell pdfPCell;
        pdfPCell = new PdfPCell(new Phrase("\nTO, \n" + f_txt_c_name + ",\n \n" + f_txt_address + "", fSubTitle));
        pdfPCell.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCell.setFixedHeight(100);
        pdfPCell.setBorderWidthTop(0);
        pdfPCell.setPaddingLeft(10);
        pdfPCell.setExtraParagraphSpace(2);
        pdfPTable.addCell(pdfPCell);


        PdfPCell pdfPCel2;
        pdfPCel2 = new PdfPCell(new Phrase("\n Quo. No : C0/QU/18-19/00001 \n Date       : " + f_inq_date + "\n Cont. Per. : " + f_txt_con_per + "", fSubTitle1));
        pdfPCel2.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel2.setHorizontalAlignment(Element.ALIGN_LEFT);
        pdfPCel2.setFixedHeight(20);
        pdfPCel2.setBorderWidthTop(0);
        pdfPCel2.setBorderWidthLeft(0);
        pdfPCel2.setPaddingLeft(12);
        pdfPCel2.setExtraParagraphSpace(2);
        pdfPTable.addCell(pdfPCel2);


        PdfPTable myTable3 = new PdfPTable(1);
        myTable3.setWidthPercentage(100.0f);
        myTable3.setSpacingBefore(0);
        PdfPCell myCell3 = new PdfPCell(new Paragraph(" \n E-mail    : " + f_txt_email + " \n Mob. : " + f_txt_mob_no + " \n \n Referance : " + f_txt_refer + " \n Subject   : " + f_txt_subject + " \n We are located at 401/1 SignetHub,Akshar Chowk \n\n\n ", fSubTitle));
        myCell3.setVerticalAlignment(Element.ALIGN_CENTER);
        myCell3.setBorderWidthTop(0);
        myCell3.setFixedHeight(105);
        myTable3.addCell(myCell3);


        float[] columnWidths1 = {0.6f, 2f, 0.7f, 0.7f, 0.6f, 1f, 1.1f, 1.1f};
        PdfPTable pdfPTable4 = new PdfPTable(columnWidths1);
        pdfPTable4.setSpacingBefore(0);
        pdfPTable4.setWidthPercentage(100);
        PdfPCell pdfPCel4;
        pdfPCel4 = new PdfPCell(new Phrase("Sr.No", f_sTitle));
        pdfPCel4.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel4.setHorizontalAlignment(Element.ALIGN_CENTER);
        pdfPCel4.setFixedHeight(35);
        pdfPCel4.setBorderWidthTop(0);
        pdfPTable4.addCell(pdfPCel4);


        PdfPCell pdfPCel14;
        pdfPCel14 = new PdfPCell(new Phrase("Item Name", f_sTitle));
        pdfPCel14.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel14.setHorizontalAlignment(Element.ALIGN_CENTER);
        pdfPCel14.setFixedHeight(20);
        pdfPCel14.setBorderWidthTop(0);
        pdfPTable4.addCell(pdfPCel14);


        PdfPCell pdfPCel48;
        pdfPCel48 = new PdfPCell(new Phrase("HSN", f_sTitle));
        pdfPCel48.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel48.setHorizontalAlignment(Element.ALIGN_CENTER);
        pdfPCel48.setFixedHeight(20);
        pdfPCel48.setBorderWidthTop(0);
        pdfPTable4.addCell(pdfPCel48);


        PdfPCell pdfPCel44;
        pdfPCel44 = new PdfPCell(new Phrase("Qty", f_sTitle));
        pdfPCel44.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel44.setHorizontalAlignment(Element.ALIGN_CENTER);
        pdfPCel44.setFixedHeight(20);
        pdfPCel44.setBorderWidthTop(0);
        pdfPTable4.addCell(pdfPCel44);


        PdfPCell pdfPCel24;
        pdfPCel24 = new PdfPCell(new Phrase("Unit", f_sTitle));
        pdfPCel24.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel24.setHorizontalAlignment(Element.ALIGN_CENTER);
        pdfPCel24.setFixedHeight(20);
        pdfPCel24.setBorderWidthTop(0);
        pdfPTable4.addCell(pdfPCel24);


        PdfPCell pdfPCel54;
        pdfPCel54 = new PdfPCell(new Phrase("Tax", f_sTitle));
        pdfPCel54.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel54.setHorizontalAlignment(Element.ALIGN_CENTER);
        pdfPCel54.setFixedHeight(20);
        pdfPCel54.setBorderWidthTop(0);
        pdfPTable4.addCell(pdfPCel54);


        PdfPCell pdfPCel34;
        pdfPCel34 = new PdfPCell(new Phrase("Unit Rate \n   Rs ", f_sTitle));
        pdfPCel34.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel34.setHorizontalAlignment(Element.ALIGN_CENTER);
        pdfPCel34.setFixedHeight(20);
        pdfPCel34.setBorderWidthTop(0);
        pdfPTable4.addCell(pdfPCel34);


        PdfPCell pdfPCel64;
        pdfPCel64 = new PdfPCell(new Phrase("Amount", f_sTitle));
        pdfPCel64.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel64.setHorizontalAlignment(Element.ALIGN_CENTER);
        pdfPCel64.setFixedHeight(20);
        pdfPCel64.setBorderWidthTop(0);
        pdfPTable4.addCell(pdfPCel64);


///---  Item ---///

        paragraph.add(myTable);
        paragraph.add(pdfPTable);
        paragraph.add(myTable3);
        paragraph.add(pdfPTable4);


        float[] co_wi_item = {0.6f, 2f, 0.7f, 0.7f, 0.6f, 1f, 1.1f, 1.1f};
        PdfPTable Item_table = new PdfPTable(co_wi_item);
        Item_table.setSpacingBefore(0);
        Item_table.setWidthPercentage(100);
        Coust_Item_List_Array coust_item_list_srray = PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this);

        for (int p = 0; p < coust_item_list_srray.getCoust_item_list().size(); p++) {

            Coust_Item_List coust_Item_List = coust_item_list_srray.getCoust_item_list().get(p);


            PdfPCell Item_Cel1;
            Item_Cel1 = new PdfPCell(new Phrase("" + (p + 1), fs_item));
            Item_Cel1.setVerticalAlignment(Element.ALIGN_CENTER);
            Item_Cel1.setHorizontalAlignment(Element.ALIGN_CENTER);
            Item_Cel1.setFixedHeight(35);
            Item_Cel1.setBorderWidthTop(0);
            Item_table.addCell(Item_Cel1);


            PdfPCell Item_Cel2;
            Item_Cel2 = new PdfPCell(new Phrase(" " + coust_Item_List.getF_txt_item() + "\n\n " + coust_Item_List.getF_txt_item_desc() + "\n\n", fs_item));
            Item_Cel2.setVerticalAlignment(Element.ALIGN_CENTER);
            Item_Cel2.setBorderWidthTop(0);
            Item_table.addCell(Item_Cel2);

            PdfPCell Item_Cel58;
            Item_Cel58 = new PdfPCell(new Phrase("", fs_item));
            Item_Cel58.setVerticalAlignment(Element.ALIGN_CENTER);
            Item_Cel58.setHorizontalAlignment(Element.ALIGN_CENTER);
            Item_Cel58.setBorderWidthTop(0);
            Item_table.addCell(Item_Cel58);

            PdfPCell Item_Cel5;
            Item_Cel5 = new PdfPCell(new Phrase("" + coust_Item_List.getF_txt_qty(), fs_item));
            Item_Cel5.setVerticalAlignment(Element.ALIGN_CENTER);
            Item_Cel5.setHorizontalAlignment(Element.ALIGN_CENTER);
            Item_Cel5.setBorderWidthTop(0);
            Item_table.addCell(Item_Cel5);

            PdfPCell Item_Cel3;
            Item_Cel3 = new PdfPCell(new Phrase("" + coust_Item_List.getF_txt_umo(), fs_item));
            Item_Cel3.setVerticalAlignment(Element.ALIGN_CENTER);
            Item_Cel3.setHorizontalAlignment(Element.ALIGN_CENTER);
            Item_Cel3.setBorderWidthTop(0);
            Item_table.addCell(Item_Cel3);

            PdfPCell Item_Cel6;
            Item_Cel6 = new PdfPCell(new Phrase("" + coust_Item_List.getTxt_tclass(), fs_item));
            Item_Cel6.setVerticalAlignment(Element.ALIGN_CENTER);
            Item_Cel6.setHorizontalAlignment(Element.ALIGN_CENTER);
            Item_Cel6.setBorderWidthTop(0);
            Item_table.addCell(Item_Cel6);


            PdfPCell Item_Cel4;
            Item_Cel4 = new PdfPCell(new Phrase("" + coust_Item_List.getF_txt_rate(), fs_item));
            Item_Cel4.setVerticalAlignment(Element.ALIGN_CENTER);
            Item_Cel4.setHorizontalAlignment(Element.ALIGN_CENTER);
            Item_Cel4.setBorderWidthTop(0);
            Item_table.addCell(Item_Cel4);


            PdfPCell Item_Cel7;
            Item_Cel7 = new PdfPCell(new Phrase("" + coust_Item_List.getF_txt_amount(), fs_amount));
            Item_Cel7.setVerticalAlignment(Element.ALIGN_CENTER);
            Item_Cel7.setHorizontalAlignment(Element.ALIGN_RIGHT);
            Item_Cel7.setBorderWidthTop(0);
            Item_Cel7.setPaddingRight(10);
            Item_table.addCell(Item_Cel7);


        }
        paragraph.add(Item_table);
        //-------------   ITEM END

        float[] columnWidths2 = {0.5f, 1.9f, 0.7f, 0.5f};
        PdfPTable pdfPTable5 = new PdfPTable(columnWidths2);
        pdfPTable5.setSpacingBefore(0);
        pdfPTable5.setWidthPercentage(100);
        PdfPCell pdfPCel5;
        pdfPCel5 = new PdfPCell(new Phrase(" Rupee :   \n\n", f_sTitle));
        pdfPCel5.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel5.setHorizontalAlignment(Element.ALIGN_LEFT);
        pdfPCel5.setBorderWidthTop(0);
        pdfPCel5.setBorderWidthBottom(0);
        pdfPCel5.setBorderWidthRight(0);
        pdfPTable5.addCell(pdfPCel5);


        PdfPCell pdfPCel15;
        pdfPCel15 = new PdfPCell(new Phrase("" + return_val_in_english, fs_item));
        pdfPCel15.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel15.setBorderWidthTop(0);
        pdfPCel15.setBorderWidthRight(0);
        pdfPCel15.setBorderWidthLeft(0);
        pdfPCel15.setBorderWidthBottom(0);
        pdfPTable5.addCell(pdfPCel15);


        PdfPCell pdfPCel16;
        pdfPCel16 = new PdfPCell(new Phrase("Total Amount", f_sTitle));
        pdfPCel16.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel16.setHorizontalAlignment(Element.ALIGN_RIGHT);
        pdfPCel16.setBorderWidthTop(0);
        pdfPCel16.setBorderWidthRight(0);
        pdfPCel16.setBorderWidthLeft(0);
        pdfPCel16.setPaddingRight(10);
        pdfPCel16.setBorderWidthBottom(0);
        pdfPTable5.addCell(pdfPCel16);


        PdfPCell pdfPCel17;
        pdfPCel17 = new PdfPCell(new Phrase("" + f_total_net_amount, fs_item));
        pdfPCel17.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel17.setHorizontalAlignment(Element.ALIGN_RIGHT);
        pdfPCel17.setBorderWidthTop(0);
        pdfPCel17.setBorderWidthBottom(0);
        pdfPCel17.setPaddingRight(10);
        pdfPTable5.addCell(pdfPCel17);


        float[] columnWidths23 = {2.5f, 0.4f};
        PdfPTable pdfPTable95 = new PdfPTable(columnWidths23);
        pdfPTable95.setSpacingBefore(0);
        pdfPTable95.setWidthPercentage(100);
        PdfPCell pdfPCel59;
        pdfPCel59 = new PdfPCell(new Phrase(" SGST Amount   \n", f_sTitle));
        pdfPCel59.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel59.setHorizontalAlignment(Element.ALIGN_RIGHT);
        pdfPCel59.setBorderWidthTop(0);
        pdfPCel59.setPaddingRight(10);
        pdfPCel59.setBorderWidthBottom(0);
        pdfPCel59.setBorderWidthRight(0);
        pdfPTable95.addCell(pdfPCel59);


        PdfPCell pdfPCel159;
        pdfPCel159 = new PdfPCell(new Phrase("" + f_total_sgst, fs_item));
        pdfPCel159.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel159.setHorizontalAlignment(Element.ALIGN_RIGHT);
        pdfPCel159.setBorderWidthTop(0);
        pdfPCel159.setPaddingRight(10);
        pdfPCel159.setBorderWidthBottom(0);
        pdfPTable95.addCell(pdfPCel159);


        float[] columnWidths231 = {2.5f, 0.4f};
        PdfPTable pdfPTable951 = new PdfPTable(columnWidths231);
        pdfPTable951.setSpacingBefore(0);
        pdfPTable951.setWidthPercentage(100);
        PdfPCell pdfPCel591;
        pdfPCel591 = new PdfPCell(new Phrase(" CGST Amount    \n", f_sTitle));
        pdfPCel591.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel591.setHorizontalAlignment(Element.ALIGN_RIGHT);
        pdfPCel591.setBorderWidthTop(0);
        pdfPCel591.setPaddingRight(10);
        pdfPCel591.setBorderWidthBottom(0);
        pdfPCel591.setBorderWidthRight(0);
        pdfPTable951.addCell(pdfPCel591);


        PdfPCell pdfPCel1591;
        pdfPCel1591 = new PdfPCell(new Phrase("" + f_total_cgst, fs_item));
        pdfPCel1591.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel1591.setHorizontalAlignment(Element.ALIGN_RIGHT);
        pdfPCel1591.setBorderWidthTop(0);
        pdfPCel1591.setBorderWidthBottom(0);
        pdfPCel1591.setPaddingRight(10);
        pdfPTable951.addCell(pdfPCel1591);


        float[] columnWidths2314 = {2.5f, 0.4f};
        PdfPTable pdfPTable9514 = new PdfPTable(columnWidths2314);
        pdfPTable9514.setSpacingBefore(0);
        pdfPTable9514.setWidthPercentage(100);
        PdfPCell pdfPCel5914;
        pdfPCel5914 = new PdfPCell(new Phrase(" Net Amount   \n\n \n", f_sTitle));
        pdfPCel5914.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel5914.setHorizontalAlignment(Element.ALIGN_RIGHT);
        pdfPCel5914.setBorderWidthTop(0);
        pdfPCel5914.setBorderWidthRight(0);
        pdfPCel5914.setPaddingRight(10);
        pdfPTable9514.addCell(pdfPCel5914);


        PdfPCell pdfPCel15914;
        pdfPCel15914 = new PdfPCell(new Phrase("" + f_txt_total_Ammount, fs_item));
        pdfPCel15914.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel15914.setHorizontalAlignment(Element.ALIGN_RIGHT);
        pdfPCel15914.setBorderWidthTop(0);
        pdfPCel15914.setPaddingRight(10);
        pdfPTable9514.addCell(pdfPCel15914);


        float[] columnWidths3 = {0.6f, 1f, 0.6f, 1f, 1f, 1f};
        PdfPTable pdfPTable6 = new PdfPTable(columnWidths3);
        pdfPTable6.setSpacingBefore(0);
        pdfPTable6.setWidthPercentage(100);
        PdfPCell pdfPCel61;
        pdfPCel61 = new PdfPCell(new Phrase(" " + Name1 + " :\n\n", f_sTitle));
        pdfPCel61.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel61.setHorizontalAlignment(Element.ALIGN_LEFT);
        pdfPCel61.setBorderWidthTop(0);
        pdfPCel61.setBorderWidthRight(0);
        pdfPCel61.setBorderWidthBottom(0);
        pdfPTable6.addCell(pdfPCel61);


        PdfPCell pdfPCel62;
        pdfPCel62 = new PdfPCell(new Phrase("" + Value1 + "", fs_item));
        pdfPCel62.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel62.setHorizontalAlignment(Element.ALIGN_LEFT);
        pdfPCel62.setBorderWidthTop(0);
        pdfPCel62.setBorderWidthRight(0);
        pdfPCel62.setBorderWidthLeft(0);
        pdfPCel62.setBorderWidthBottom(0);
        pdfPTable6.addCell(pdfPCel62);


        PdfPCell pdfPCel63;
        pdfPCel63 = new PdfPCell(new Phrase("" + Name2 + " :", f_sTitle));
        pdfPCel63.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel63.setHorizontalAlignment(Element.ALIGN_RIGHT);
        pdfPCel63.setBorderWidthTop(0);
        pdfPCel63.setBorderWidthRight(0);
        pdfPCel63.setBorderWidthLeft(0);
        pdfPCel63.setBorderWidthBottom(0);
        pdfPTable6.addCell(pdfPCel63);


        PdfPCell pdfPCel65;
        pdfPCel65 = new PdfPCell(new Phrase("" + Value2 + "", fs_item));
        pdfPCel65.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel65.setHorizontalAlignment(Element.ALIGN_LEFT);
        pdfPCel65.setBorderWidthTop(0);
        pdfPCel65.setBorderWidthBottom(0);
        pdfPCel65.setBorderWidthRight(0);
        pdfPCel65.setBorderWidthLeft(0);
        pdfPTable6.addCell(pdfPCel65);


        PdfPCell pdfPCel67;
        pdfPCel67 = new PdfPCell(new Phrase("" + Name3 + " :", f_sTitle));
        pdfPCel67.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel67.setHorizontalAlignment(Element.ALIGN_RIGHT);
        pdfPCel67.setBorderWidthTop(0);
        pdfPCel67.setBorderWidthRight(0);
        pdfPCel67.setBorderWidthLeft(0);
        pdfPCel67.setBorderWidthBottom(0);
        pdfPTable6.addCell(pdfPCel67);


        PdfPCell pdfPCel68;
        pdfPCel68 = new PdfPCell(new Phrase("" + Value3 + "", fs_item));
        pdfPCel68.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCel68.setHorizontalAlignment(Element.ALIGN_LEFT);
        pdfPCel68.setBorderWidthTop(0);
        pdfPCel68.setPaddingRight(10);
        pdfPCel68.setBorderWidthBottom(0);
        pdfPCel68.setBorderWidthLeft(0);
        pdfPTable6.addCell(pdfPCel68);


        float[] columnWidthsa = {1f, 0.6f, 1f, 1.2f, 1f, 1.2f};
        PdfPTable pdfPTablea = new PdfPTable(6);
        pdfPTablea.setSpacingBefore(0);
        pdfPTablea.setWidthPercentage(100);
        PdfPCell pdfPCela;
        pdfPCela = new PdfPCell(new Phrase("" + Name4 + " :\n\n\n", f_sTitle10));
        pdfPCela.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCela.setHorizontalAlignment(Element.ALIGN_LEFT);
        pdfPCela.setBorderWidthTop(0);
        pdfPCela.setBorderWidthRight(0);
        pdfPTablea.addCell(pdfPCela);


        PdfPCell pdfPCela1;
        pdfPCela1 = new PdfPCell(new Phrase("" + Value4, fs_item10));
        pdfPCela1.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCela1.setHorizontalAlignment(Element.ALIGN_LEFT);
        pdfPCela1.setBorderWidthTop(0);
        pdfPCela1.setBorderWidthRight(0);
        pdfPCela1.setBorderWidthLeft(0);
        pdfPTablea.addCell(pdfPCela1);


        PdfPCell pdfPCela2;
        pdfPCela2 = new PdfPCell(new Phrase("" + Name5 + " :", f_sTitle10));
        pdfPCela2.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCela2.setHorizontalAlignment(Element.ALIGN_RIGHT);
        pdfPCela2.setBorderWidthTop(0);
        pdfPCela2.setBorderWidthRight(0);
        pdfPCela2.setBorderWidthLeft(0);
        pdfPTablea.addCell(pdfPCela2);


        PdfPCell pdfPCela3;
        pdfPCela3 = new PdfPCell(new Phrase("" + Value5, fs_item10));
        pdfPCela3.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCela3.setHorizontalAlignment(Element.ALIGN_LEFT);
        pdfPCela3.setBorderWidthTop(0);
        pdfPCela3.setBorderWidthRight(0);
        pdfPCela3.setBorderWidthLeft(0);
        pdfPTablea.addCell(pdfPCela3);


        PdfPCell pdfPCela4;
        pdfPCela4 = new PdfPCell(new Phrase("" + Name6 + " :", f_sTitle10));
        pdfPCela4.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCela4.setHorizontalAlignment(Element.ALIGN_RIGHT);
        pdfPCela4.setBorderWidthTop(0);
        pdfPCela4.setBorderWidthRight(0);
        pdfPCela4.setBorderWidthLeft(0);
        pdfPTablea.addCell(pdfPCela4);


        PdfPCell pdfPCela5;
        pdfPCela5 = new PdfPCell(new Phrase("" + Value6, fs_item10));
        pdfPCela5.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCela5.setHorizontalAlignment(Element.ALIGN_LEFT);
        pdfPCela5.setBorderWidthTop(0);
        pdfPCela5.setPaddingRight(10);
        pdfPCela5.setBorderWidthLeft(0);
        pdfPTablea.addCell(pdfPCela5);


        PdfPTable pdfPTableb = new PdfPTable(1);
        pdfPTableb.setSpacingBefore(0);
        pdfPTableb.setWidthPercentage(100);
        PdfPCell pdfPCelb;
        pdfPCelb = new PdfPCell(new Phrase(" Terms & Conditions: \n\n", f_sTitle));
        pdfPCelb.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCelb.setHorizontalAlignment(Element.ALIGN_LEFT);
        pdfPCelb.setBorderWidthTop(0);
        pdfPCelb.setBorderWidthBottom(0);
        pdfPTableb.addCell(pdfPCelb);


        PdfPTable pdfPTablec = new PdfPTable(1);
        pdfPTablec.setSpacingBefore(0);
        pdfPTablec.setWidthPercentage(100);

        for (int k = 0; k < selectedItems.size(); k++) {

            PdfPCell pdfPCelc;
            pdfPCelc = new PdfPCell(new Phrase(" " + (k + 1) + " " + selectedItems.get(k).toString() + " \n", fs_item));
            pdfPCelc.setVerticalAlignment(Element.ALIGN_CENTER);
            pdfPCelc.setHorizontalAlignment(Element.ALIGN_LEFT);
            pdfPCelc.setBorderWidthTop(0);
            pdfPCelc.setBorderWidthBottom(0);
            pdfPTablec.addCell(pdfPCelc);

        }

        PdfPCell pdfPCelc32;
        pdfPCelc32 = new PdfPCell(new Phrase(" \n", fs_item));
        pdfPCelc32.setVerticalAlignment(Element.ALIGN_CENTER);
        pdfPCelc32.setHorizontalAlignment(Element.ALIGN_LEFT);
        pdfPCelc32.setBorderWidthTop(0);
        pdfPTablec.addCell(pdfPCelc32);


        paragraph.add(pdfPTable5);
        paragraph.add(pdfPTable95);
        paragraph.add(pdfPTable951);
        paragraph.add(pdfPTable9514);
        paragraph.add(pdfPTable6);
        paragraph.add(pdfPTablea);
        paragraph.add(pdfPTableb);
        paragraph.add(pdfPTablec);
        document.add(paragraph);


        document.close();
        // previewPdf();

        // Email_call();

        // ADD_Item();

        ADD_Item();


    }


    private void ADD_Item() {


        Cnt = 0;
        String XMLString = "";

        XMLString = "<NewDataSet>";

        if (PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this) != null) {
            Coust_Item_List_Array coust_item_list_srray = PrefUtils.get_coust_item_list_srray(Qyotation_Activity.this);

            for (int p = 0; p < coust_item_list_srray.getCoust_item_list().size(); p++) {

                Coust_Item_List coust_Item_List = coust_item_list_srray.getCoust_item_list().get(p);

                XMLString = XMLString + "<Table>";
                XMLString = XMLString + "<ItemID>" + coust_Item_List.getF_txt_item_id() + "</ItemID>";
                XMLString = XMLString + "<ItemDesc>" + coust_Item_List.getF_txt_item_desc() + "</ItemDesc>";
                XMLString = XMLString + "<CurrencyID>" + "1" + "</CurrencyID>";
                XMLString = XMLString + "<Qty>" + coust_Item_List.getF_txt_qty().toString() + "</Qty>";
                XMLString = XMLString + "<Rate>" + coust_Item_List.getF_txt_rate() + "</Rate>";
                XMLString = XMLString + "<Amount>" + coust_Item_List.getF_txt_amount() + "</Amount>";
                XMLString = XMLString + "<TaxClassID>" + coust_Item_List.getTxt_tclass() + "</TaxClassID>";
//coust_Item_List.getTxt_tclass()
                XMLString = XMLString + "<ServiceRate>" + "0" + "</ServiceRate>";
                XMLString = XMLString + "<ServiceAmount>" + "0" + "</ServiceAmount>";

                XMLString = XMLString + "<ExciseRate>" + "0" + "</ExciseRate>";
                XMLString = XMLString + "<ExciseAmount>" + "0" + "</ExciseAmount>";
                XMLString = XMLString + "<EduCessRate>" + "0" + "</EduCessRate>";
                XMLString = XMLString + "<EduCessAmount>" + "0" + "</EduCessAmount>";
                XMLString = XMLString + "<HEduCessRate>" + "0" + "</HEduCessRate>";
                XMLString = XMLString + "<HEduCessAmount>" + "0" + "</HEduCessAmount>";
                XMLString = XMLString + "<AmountAfterExcise>" + "0" + "</AmountAfterExcise>";
                XMLString = XMLString + "<CSTRate>" + "0" + "</CSTRate>";
                XMLString = XMLString + "<CSTAmount>" + "0" + "</CSTAmount>";
                XMLString = XMLString + "<VATRate>" + "0" + "</VATRate>";
                XMLString = XMLString + "<VATAmount>" + "0" + "</VATAmount>";
                XMLString = XMLString + "<AVATRate>" + "0" + "</AVATRate>";
                XMLString = XMLString + "<AVATAmount>" + "0" + "</AVATAmount>";

                XMLString = XMLString + "<SBCessRate>" + "0" + "</SBCessRate>";
                XMLString = XMLString + "<SBCessAmount>" + "0" + "</SBCessAmount>";

                XMLString = XMLString + "<ExtraTaxRate>" + "0" + "</ExtraTaxRate>";
                XMLString = XMLString + "<ExtraTaxAmount>" + "0" + "</ExtraTaxAmount>";


                XMLString = XMLString + "<SGSTRate>" + coust_Item_List.getF_txt_sgst_rate() + "</SGSTRate>";
                XMLString = XMLString + "<SGSTAmount>" + coust_Item_List.getF_txt_sgst() + "</SGSTAmount>";

                XMLString = XMLString + "<CGSTRate>" + coust_Item_List.getF_txt_cgst_rate() + "</CGSTRate>";
                XMLString = XMLString + "<CGSTAmount>" + coust_Item_List.getF_txt_cgst() + "</CGSTAmount>";

                XMLString = XMLString + "<IGSTRate>" + coust_Item_List.getF_txt_igst() + "</IGSTRate>";
                XMLString = XMLString + "<IGSTAmount>" + coust_Item_List.getF_txt_igst() + "</IGSTAmount>";
                XMLString = XMLString + "<NetAmount>" + coust_Item_List.getF_txt_net_ammount2() + "</NetAmount>";
                XMLString = XMLString + "<Discount>" + coust_Item_List.getF_txt_discount() + "</Discount>";

                XMLString = XMLString + "<GodownID>" + "1" + "</GodownID>";
                XMLString = XMLString + "</Table> ";
                Cnt = Cnt + 1;


            }


        }
        XMLString = XMLString.toString() + "</NewDataSet>";

        XMLString = XMLString.toString().replace("&", "&amp;");
        XMLString = XMLString.toString().replace(">", "&gt;");
        XMLString = XMLString.toString().replace("<", "&lt;");


        Log.e("XMLString :--  ", "" + XMLString);

        Log.e("OKOk------------", "" + Integer.parseInt(c_name_ID) + "-" + ap_take_ID + "-" + f_inq_date + "-" + f_total_net_amount + "-" + "0" + "-" + "0" + "-" + f_txt_refer + "-" + userID + "-" + "" + Cnt + "-" + "1" + "-" + "RefNo" + "-" + f_total_net_amount + "-" + "0" + "-" + "0" + "-" + "0" + "-" + "0" + "-" + "0" + "-" + "0" + "-" + "0" + "-" + "0" + "-" + "0" + "-" + "0" + "-" + "0.00" + "-" + f_txt_total_Ammount + "-" + "Quotation" + "-" + "lop" + "-" + f_next_date + "-" + XMLString + "-" + f_txt_refer + "-" + f_txt_Remarks + "-" + "" + "-" + "" + "-::::" + allocated_ID + "-" + "1" + "-" + "" + "-" + compID + "-" + "false" + "-" + f_txt_con_per + "-" + f_txt_email + "-" + f_txt_mob_no + "-" + f_txt_category);

        SendQuotation(XMLString);
    }


    private void addChildp(Paragraph childParagraph) {

        childParagraph.setAlignment(Element.ALIGN_CENTER);
        childParagraph.setSpacingBefore(100);
        paragraph.add(childParagraph);
    }


    @Override
    public void onPageChanged(int page, int pageCount) {

        num = page;
    }


    private void Email_call() {


        new Thread(new Runnable() {

            public void run() {


                try {
                    Properties props = new Properties();
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.starttls.enable", "true");
                    props.put("mail.smtp.host", "smtp.gmail.com");
                    props.put("mail.smtp.port", "587");

                    Session session = Session.getInstance(props,
                            new javax.mail.Authenticator() {
                                protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                                    return new javax.mail.PasswordAuthentication(
                                            username, password);
                                }
                            });
                    // TODO Auto-generated method stub
                    Message message = new MimeMessage(session);
                    message.setFrom(new InternetAddress("saleskitsoftware@gmail.com"));
                    message.setRecipients(Message.RecipientType.TO,
                            InternetAddress.parse("saleskitsoftware@gmail.com"));
                    message.setSubject("email");
                    message.setText("HI,"
                            + "\n\n great");


                    Multipart _multipart = new MimeMultipart();
                    BodyPart messageBodyPart = new MimeBodyPart();
                    DataSource source = new FileDataSource("/storage/emulated/0/Documents/a.pdf");
                    Log.e("filename1", "" + "/storage/emulated/0/Documents/a.pdf");
                    messageBodyPart.setDataHandler(new DataHandler(source));
                    messageBodyPart.setFileName("QUOTATION.pdf");

                    _multipart.addBodyPart(messageBodyPart);
                    message.setContent(_multipart);

                    Transport.send(message);
                    System.out.println("Done");


                } catch (MessagingException e) {
                    throw new RuntimeException(e);
                }
            }

        }).start();

    }


    private void previewPdf() {
        kj = "1";
        scrol1.setVisibility(View.GONE);
        PackageManager packageManager = getPackageManager();
        Intent testIntent = new Intent(Intent.ACTION_VIEW);
        testIntent.setType("application/pdf");
        List list = packageManager.queryIntentActivities(testIntent, PackageManager.MATCH_DEFAULT_ONLY);
        if (list.size() > 0) {

            uri = Uri.fromFile(pdfFile);

            Log.e("uri", "" + uri);
            Log.e("pdfFile", "" + pdfFile);

            pdfView.fromFile(pdfFile)
                    .defaultPage(num)
                    .onPageChange(this)
                    .load();

        } else {
            Toast.makeText(this, "Download a PDF Viewer to see the generated PDF", Toast.LENGTH_SHORT).show();
        }
    }


    public static class EnglishNumberToWords {

        private static final String[] tensNames = {"", " ten", " twenty", " thirty", " forty",
                " fifty", " sixty", " seventy", " eighty", " ninety"};

        private static final String[] numNames = {"", " one", " two", " three", " four", " five",
                " six", " seven", " eight", " nine", " ten", " eleven", " twelve", " thirteen",
                " fourteen", " fifteen", " sixteen", " seventeen", " eighteen", " nineteen"};

        private static String convertLessThanOneThousand(int number) {
            String soFar;

            if (number % 100 < 20) {
                soFar = numNames[number % 100];
                number /= 100;
            } else {
                soFar = numNames[number % 10];
                number /= 10;

                soFar = tensNames[number % 10] + soFar;
                number /= 10;
            }
            if (number == 0)
                return soFar;
            return numNames[number] + " hundred" + soFar;
        }

        public static String convert(long number) {
            // 0 to 999 999 999 999
            if (number == 0) {
                return "zero";
            }

            String snumber = Long.toString(number);

            // pad with "0"
            String mask = "000000000000";
            DecimalFormat df = new DecimalFormat(mask);
            snumber = df.format(number);

            // XXXnnnnnnnnn
            int billions = Integer.parseInt(snumber.substring(0, 3));
            // nnnXXXnnnnnn
            int millions = Integer.parseInt(snumber.substring(3, 6));
            // nnnnnnXXXnnn
            int hundredThousands = Integer.parseInt(snumber.substring(6, 9));
            // nnnnnnnnnXXX
            int thousands = Integer.parseInt(snumber.substring(9, 12));

            String tradBillions;
            switch (billions) {
                case 0:
                    tradBillions = "";
                    break;
                case 1:
                    tradBillions = convertLessThanOneThousand(billions) + " billion ";
                    break;
                default:
                    tradBillions = convertLessThanOneThousand(billions) + " billion ";
            }
            String result = tradBillions;

            String tradMillions;
            switch (millions) {
                case 0:
                    tradMillions = "";
                    break;
                case 1:
                    tradMillions = convertLessThanOneThousand(millions) + " million ";
                    break;
                default:
                    tradMillions = convertLessThanOneThousand(millions) + " million ";
            }
            result = result + tradMillions;

            String tradHundredThousands;
            switch (hundredThousands) {
                case 0:
                    tradHundredThousands = "";
                    break;
                case 1:
                    tradHundredThousands = "one thousand ";
                    break;
                default:
                    tradHundredThousands = convertLessThanOneThousand(hundredThousands) + " thousand ";
            }
            result = result + tradHundredThousands;

            String tradThousand;
            tradThousand = convertLessThanOneThousand(thousands);
            result = result + tradThousand;

            // remove extra spaces!
            return result.replaceAll("^\\s+", "").replaceAll("\\b\\s{2,}\\b", " ");
        }

    }


    public class CustomAdapter extends BaseAdapter {

        private ArrayList<TNCSub_List> counteryList;
        private Context context;
        private boolean isSelected[];

        public CustomAdapter(Context context, ArrayList<TNCSub_List> counteryList) {
            this.context = context;
            this.counteryList = counteryList;
            isSelected = new boolean[counteryList.size()];
        }


        @Override
        public int getCount() {
            return counteryList.size();
        }

        @Override
        public Object getItem(int arg0) {
            return null;
        }

        @Override
        public long getItemId(int arg0) {
            return 0;
        }

        @Override
        public View getView(final int position, View view, ViewGroup viewGroup) {
            final ViewHolder holder;

            if (view == null) {
                view = LayoutInflater.from(context).inflate(R.layout.row_listview, null);
                holder = new ViewHolder();
                holder.relativeLayout = (RelativeLayout) view.findViewById(R.id.row_relative_layout);
                holder.checkedTextView = (CheckedTextView) view.findViewById(R.id.row_list_checkedtextview);
                holder.checkedImage = (ImageView) view.findViewById(R.id.row_list_checkbox_image);

                Typeface font = Typeface.createFromAsset(context.getAssets(),
                        "fonts/MavenPro-Medium.ttf");

                holder.checkedTextView.setTypeface(font);

                view.setTag(holder);
            } else {
                holder = (ViewHolder) view.getTag();
            }

            holder.checkedTextView.setText(counteryList.get(position).getTNC_Desc());


//            String tt = counteryList.get(position).getTNCflag();
//
//            if (tt.equalsIgnoreCase("0")) {
//
            holder.checkedImage.setImageDrawable(ContextCompat.getDrawable(context, R.drawable.square));
//
//            } else if (tt.equalsIgnoreCase("1")) {
//
//                holder.checkedImage.setImageDrawable(ContextCompat.getDrawable(context, R.drawable.tick_box));
//
//            }


            holder.relativeLayout.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    // set the check text view
                    boolean flag = holder.checkedTextView.isChecked();
                    holder.checkedTextView.setChecked(!flag);
                    isSelected[position] = !isSelected[position];

                    if (holder.checkedTextView.isChecked()) {
                        holder.checkedImage.setImageDrawable(ContextCompat.getDrawable(context, R.drawable.tick_box));

//                        tNCSub_list_array = PrefUtils.get_tncsub_List_Array(Qyotation_Activity.this);
//
//                        tNCSub_list_array.getTncsub_list().get(position).setTNCflag("1");
//                        tNCSub_list_array.tncsub_list = tNCSub_list_array.getTncsub_list();
//                        PrefUtils.set_tncsub_List_Array(tNCSub_list_array, Qyotation_Activity.this);
//                        customAdapter.notifyDataSetChanged();


                    } else {
                        holder.checkedImage.setImageDrawable(ContextCompat.getDrawable(context, R.drawable.square));
                        holder.relativeLayout.setBackgroundResource(0);

//                        tNCSub_list_array = PrefUtils.get_tncsub_List_Array(Qyotation_Activity.this);
//
//                        tNCSub_list_array.getTncsub_list().get(position).setTNCflag("0");
//                        tNCSub_list_array.tncsub_list = tNCSub_list_array.getTncsub_list();
//                        PrefUtils.set_tncsub_List_Array(tNCSub_list_array, Qyotation_Activity.this);
//                        customAdapter.notifyDataSetChanged();
                    }
                }
            });

            return view;
        }

        public boolean[] getSelectedFlags() {
            return isSelected;
        }

        private class ViewHolder {
            RelativeLayout relativeLayout;
            CheckedTextView checkedTextView;
            ImageView checkedImage;
        }

    }

    @Override
    public void onBackPressed() {
        if (kj.equalsIgnoreCase("0")) {

            super.onBackPressed();
        } else {

            scrol1.setVisibility(View.VISIBLE);

        }

    }


    private void SendQuotation(String XMLString) {


        RestAdapter adapter = new RestAdapter.Builder().setEndpoint(RetrfitInterface.url).build();

        try {
//            loading = new ProgressDialog(Qyotation_Activity.this);
//            loading.setMessage("Please Wait Loading data ....");
//            loading.show();
//            loading.setCancelable(false);

        } catch (Exception e) {

        }

        //Creating Rest Services
        final RetrfitInterface restInterface = adapter.create(RetrfitInterface.class);
        Log.d("status&&&", "stat1" + restInterface);
        Log.e("c_name_ID:===", c_name_ID);

        //  restInterface.Get_InsertQuotation(Integer.parseInt(c_name_ID),ap_take_ID,f_inq_date,f_txt_total_Ammount,"0","0",f_txt_refer,userID,Cnt,"1","RefNo",f_txt_total_Ammount,"0.00",f_total_net_amount,"Quotation","",f_next_date,XMLString, new Callback<Response>()

        restInterface.Get_InsertQuotation1(Integer.parseInt(c_name_ID), ap_take_ID, f_inq_date, f_total_f_amount, "0", "0", f_txt_Remarks, userID, Cnt, "1", "RefNo", f_total_net_amount, "0.00", f_txt_total_Ammount, "Quotation", "", f_next_date, XMLString, f_txt_refer, f_txt_subject, "", "", allocated_ID, "1", "1", compID, "1", f_txt_con_per, f_txt_email, f_txt_mob_no, f_txt_category, new Callback<Response>()

        {

            @Override
            public void success(Response findChildArray, Response response) {

                Log.e("status", new String(((TypedByteArray) findChildArray.getBody()).getBytes()));

                String result = new String(((TypedByteArray) findChildArray.getBody()).getBytes());

                JSONArray jObj = null;
                try {
                    jObj = new JSONArray(result);

                    Log.e("Size", "" + jObj.length());

                    if (jObj.length() > 0) {

                        for (int i = 0; i < jObj.length(); i++) {

                            JSONObject jsonObj = jObj.getJSONObject(0);
                            String Message = jsonObj.getString("Message");

                            if (Message.equalsIgnoreCase("Record Inserted Successfully")) {

                                Toast.makeText(Qyotation_Activity.this, "" + Message, Toast.LENGTH_SHORT).show();

                                Email_call();


                            }

                        }


//                        String name = jsonObj.getString("UserName");
//                        String DispName = jsonObj.getString("DispName");
//                        String CompId = jsonObj.getString("CompId");
//
//                        String StartDate = jsonObj.getString("StartDate");
//
//                        PrefUtils.set_User_id(ID, MainActivity.this);
//                        PrefUtils.set_User_name(name, MainActivity.this);
//                        PrefUtils.set_User_mobileno(DispName, MainActivity.this);
//                        PrefUtils.set_Comp_Id(CompId, MainActivity.this);
//
//
//
//                        String ackwardDate = StartDate;
////Dirty convertion
//                        Calendar calendar = Calendar.getInstance();
//                        String ackwardRipOff = ackwardDate.replace("/Date(", "").replace(")/", "");
//                        Long timeInMillis = Long.valueOf(ackwardRipOff);
//                        calendar.setTimeInMillis(timeInMillis);
//                        System.out.println(calendar.getTime().toGMTString()); //Prints 18 Aug 2013 15:59:57 GMT
//
//
//                        Toast.makeText(MainActivity.this, "Login Successfully!", Toast.LENGTH_SHORT).show();
//                        Intent intent = new Intent(getApplicationContext(), MenuActivity.class);
//                        startActivity(intent);

                    } else {


                        Toast.makeText(Qyotation_Activity.this, "Username or Password Incorrect", Toast.LENGTH_SHORT).show();
                    }


                } catch (JSONException e) {
                    e.printStackTrace();
                }

                // loading.dismiss();

            }

            @Override
            public void failure(RetrofitError error) {

                String merror = error.getMessage();
                Log.d("error", merror);
                Toast.makeText(Qyotation_Activity.this, merror, Toast.LENGTH_LONG).show();

            }
        });


    }


}
