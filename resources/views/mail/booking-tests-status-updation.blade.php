<!DOCTYPE html>
<html>

<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <style type="text/css">
        body,
        table,
        td,
        a {
            -webkit-text-size-adjust: 100%;
            -ms-text-size-adjust: 100%;
        }

        table,
        td {
            mso-table-lspace: 0pt;
            mso-table-rspace: 0pt;
        }

        img {
            -ms-interpolation-mode: bicubic;
        }

        img {
            border: 0;
            height: auto;
            line-height: 100%;
            outline: none;
            text-decoration: none;
        }

        table {
            border-collapse: collapse !important;
        }

        body {
            height: 100% !important;
            margin: 0 !important;
            padding: 0 !important;
            width: 100% !important;
        }

        a[x-apple-data-detectors] {
            color: inherit !important;
            text-decoration: none !important;
            font-size: inherit !important;
            font-family: inherit !important;
            font-weight: inherit !important;
            line-height: inherit !important;
        }

        @media screen and (max-width: 480px) {
            .mobile-hide {
                display: none !important;
            }

            .mobile-center {
                text-align: center !important;
            }
        }

        div[style*="margin: 16px 0;"] {
            margin: 0 !important;
        }
    </style>

<body style="margin: 0 !important; padding: 0 !important; background-color: #eeeeee;" bgcolor="#eeeeee">
    
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="center" style="background-color: #eeeeee;" bgcolor="#eeeeee">
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:600px;">
                    <tr>
                        <td align="center" valign="top" style="font-size:0; padding: 35px;" bgcolor="#5b73e8">
                            <div style="display:inline-block; max-width:50%; min-width:100px; vertical-align:top; width:100%;" class="mobile-hide">
                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:300px;">
                                    <tr>
                                        <td align="right" valign="top" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; line-height: 48px;">
                                            <table cellspacing="0" cellpadding="0" border="0" align="right">
                                                <tr>
                                                    <td style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400;">
                                                        <p style="font-size: 18px; font-weight: 400; margin: 0; color: #ffffff;"><a href="#" target="_blank" style="color: #ffffff; text-decoration: none;">&nbsp;</a></p>
                                                    </td>
                                                    <td style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 24px;"> <a href="#" target="_blank" style="color: #ffffff; text-decoration: none;"><img src="{{HTML::image('images/logo-light.png')}}" width="290" height="1000" style="display: block; border: 0px;margin-left: -19px;" /></a> </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td align="center" style="padding: 35px 35px 20px 35px; background-color: #ffffff;" bgcolor="#ffffff">
                            <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:600px;">
                                <tr>
                                    <td align="center" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 25px;"> <img src="https://img.icons8.com/carbon-copy/100/000000/checked-checkbox.png" width="125" height="120" style="display: block; border: 0px;" /><br>
                                        <h2 style="font-size: 30px; font-weight: 800; line-height: 36px; color: #333333; margin: 0;"> Booking Test Status Changed Successfully! </h2>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 10px;">
                                        <p style="font-size: 16px; font-weight: 400; line-height: 24px; color: #777777;"> AUM Research Laboratories (ARL) is emerging innovation driven R&D & Testing Lab with Head Quarter in Ahmedabad, Gujarat.</p>
                                    </td>
                                </tr>
                                <tr>
                                    <h1><center>Booking Information #</center></h1>
                                </tr>
                                <tr>
                                    <td align="left" style="padding-top: 20px;">
                                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                            
                                            <tr>
                                                <td width="75%" align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;"> Booking No </td>
                                                <td width="25%" align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;"> {{{$mail_data['booking_no']!= '' || $mail_data['booking_no'] != null ? $mail_data['booking_no'] : 'Not Specified'}}}</td>
                                            </tr>
                                            <tr>
                                                <td width="75%" align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;"> Booking Type  </td>
                                                <td width="25%" align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;"> {{{$mail_data['booking_type']!= '' || $mail_data['booking_type'] != null ? $mail_data['booking_type'] : 'Not Specified'}}} </td>
                                            </tr>
                                            
                                            <tr>
                                                <td width="75%" align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;"> Report Type </td>
                                                <td width="25%" align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;"> {{{$mail_data['report_type']!= '' || $mail_data['report_type'] != null ? $mail_data['report_type'] : 'Not Specified'}}} </td>
                                            </tr>
                                            <tr>
                                                <td width="75%" align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;"> Receipte Date </td>
                                                <td width="25%" align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;"> {{{$mail_data['receipte_date']!= '' || $mail_data['receipte_date'] != null ? $mail_data['receipte_date'] : 'Not Specified'}}} </td>
                                            </tr>
                                            <tr>
                                                <td width="75%" align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;"> Reference No </td>
                                                <td width="25%" align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;"> {{{$mail_data['reference_no']!= '' || $mail_data['reference_no'] != null ? $mail_data['reference_no'] : 'Not Specified'}}} </td>
                                            </tr>
                                            <tr>
                                                <td width="75%" align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;"> Is Report Dispacthed </td>
                                                <td width="25%" align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;"> {{ $mail_data['is_report_dispacthed'] == 1 ? "Yes" : "NO" }}</td>
                                            </tr>
                                            <tr>
                                                <td width="75%" align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;"> Nabl Scope </td>
                                                <td width="25%" align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;">  {{ $mail_data['nabl_scope'] == 1 ? "Yes" : "NO" }}</td>
                                            </tr>
                                            <tr>
                                                <td width="75%" align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;"> Statement Of Conformity </td>
                                                <td width="25%" align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;"> {{{$mail_data['statement_ofconformity']!= '' || $mail_data['statement_ofconformity'] != null ? $mail_data['statement_ofconformity'] : 'Not Specified'}}} </td>
                                            </tr>
                                            <tr>
                                                <td width="75%" align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;"> Coa Release Date </td>
                                                <td width="25%" align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;"> {{{$mail_data['coa_release_date']!= '' || $mail_data['coa_release_date'] != null ? $mail_data['coa_release_date'] : 'Not Specified'}}} </td>
                                            </tr>                                          
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #ffffff;" bgcolor="#ffffff">
                            <table style="font-family: arial, sans-serif;
                            border-collapse: collapse;
                            width: 100%;">
                                <thead>
                                    <tr>
                                        <th style="border: 1px solid #dddddd;
                                        text-align: left;
                                        padding: 8px;">
                                            <h3><center>Test No</center> </h3>
                                        </th>
                                        <th style="border: 1px solid #dddddd;
                                        text-align: left;
                                        padding: 8px;">
                                            <h3><center>Test Name</center> </h3>
                                        </th>
                                        <th style="border: 1px solid #dddddd;
                                        text-align: left;
                                        padding: 8px;">
                                            <h3><center>Test Details</center> </h3>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @if(!empty($mail_data['booking_tests']))
                                    
                                        @foreach ($mail_data['booking_tests'] as $key=>$item)
                                        <tr style="border: 1px solid #dddddd;
                                        text-align: left;
                                        padding: 8px;background-color: #dddddd;">
                                            <td style="border: 1px solid #dddddd;
                                            text-align: left;
                                            padding: 8px;"> <center>{{ $key+1 }}</center>   </td>
                                            <td style="border: 1px solid #dddddd;
                                            text-align: left;
                                            padding: 8px;"><center>{{{$item['test_name'] != '' || $item['test_name'] != null ? $item['test_name'] : 'Not Specified'}}}</center>  </td>
                                            <td style="border: 1px solid #dddddd;
                                            text-align: left;
                                            padding: 8px;"><center>{{{$item['approved'] != '' || $item['approved'] != null ? $item['approved'] : 'Not Specified'}}}</center>  </td>
                                        </tr>
                                        @endforeach                
                                    @else
                                    <tr style="border: 1px solid #dddddd;
                                    text-align: left;
                                    padding: 8px;background-color: #dddddd;">
                                        <td style="border: 1px solid #dddddd;
                                        text-align: left;
                                        padding: 8px;"> <center>No Test Available</center>   </td>
                                        <td style="border: 1px solid #dddddd;
                                        text-align: left;
                                        padding: 8px;"><center>No Test Available</td>
                                        <td style="border: 1px solid #dddddd;
                                        text-align: left;
                                        padding: 8px;"><center>No Test Available</center>  </td>
                                    </tr>
                                    @endif
                                   
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr> 
                        <td align="center" style="padding: 35px; background-color: #ffffff;" bgcolor="#ffffff">
                            <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:600px;">
                                <tr>
                                    <td align="center"> <img src="{{URL::asset('images/logo-dark.png')}}"  style="display: block; border: 0px;" /> </td>
                                </tr>
                                <tr>
                                    <td align="center" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 400; line-height: 24px; padding: 5px 0 10px 0;">
                                        <p style="font-size: 14px; font-weight: 800; line-height: 18px; color: #333333;"> Block 843/P/3, opp. Amardeep plastics, <br> Rakanpur, Gujarat 382721 </p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>

</html>