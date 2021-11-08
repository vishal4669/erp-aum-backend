<?php

namespace Modules\AdminCustomer\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateEmployeeRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'company_name' => 'required|string|max:255',
            'gst_number' => 'nullable|max:15|regex:/^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$/',
            'user_name' => 'required|email|max:255',
            'password' => 'required|min:6|regex:/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,15}$/',
            'customer_contact_info.home_contact_info.*.home_pan_card' => 'nullable|regex:/[A-Z]{5}[0-9]{4}[A-Z]{1}/',
            'logo' => 'nullable|image|mimes:jpeg,png,jpg,svg|max:2048',
            'company_tin_no' => ['nullable', 'regex:/^(9\d{2})([ \-]?)([7]\d|8[0-8])([ \-]?)(\d{4})$/'],
            'customer_contact_info.other_contact_info.*.street_1' => 'nullable|max:100',
            'customer_contact_info.other_contact_info.*.street_1' => 'nullable|max:100',
            'customer_contact_info.other_contact_info.*.street_2' => 'nullable|max:100',
            'customer_contact_info.home_contact_info.*.street_1' => 'nullable|max:100',
            'customer_contact_info.home_contact_info.*.street_2' => 'nullable|max:100',
            'customer_contact_info.home_contact_info.*.email' => 'nullable|email',
            'customer_contact_info.other_contact_info.*.email' => 'nullable|email',
            'customer_contact_info.other_contact_info.*.other_qc_email' => 'nullable|email',
            'customer_contact_info.other_contact_info.*.other_pan_card_copy' => 'nullable|mimes:jpeg,png,jpg,pdf|max:2048',
            'customer_contact_info.home_contact_info.*.contact_no' => 'nullable|min:10|max:10',
            'customer_contact_info.home_contact_info.*.home_qc_contact_no' => 'nullable|min:10|max:10',
            'customer_contact_info.home_contact_info.*.home_landline' => 'nullable|regex:/^[0-9]\d{2,4}-\d{6,8}$/',
            'customer_contact_info.other_contact_info.*.contact_no' => 'nullable|min:10|max:10',
            'contact_person_data.*.contact_person_mobile' => 'nullable|min:10|max:10',
            'contact_person_data.*.contact_person_email' => 'nullable|email',

        ];
    }

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }
}
