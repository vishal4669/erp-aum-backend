<?php

    return [
        'quotation_dropdown' =>
            [
            'type' => ['Sample','Injection','Metal'],
            'status' => ['Open','In Process','To Be Distributed','Approval Request','Approved']
            ],
        'booking_dropdown' =>
        [
            'booking_type' => [
                'Received', 'Entry', 'Temp', 'W', 'Testing' ,'Data Fillup', 'Report', 'Dispatched', 'Invoice', 'Cancel'
            ],
            'report_type' => [
                'None', 'FP', 'RM', 'OT', 'TP', 'ADL', 'AYUSH'
            ],
            'common_options' => [
                //mfg_options, exp_options, d_format_options, grade_options, project_options dropdown
                //sampling_date_from_options, sampling_date_to_options
                'N/A', 'N/S','None'
            ],
            'yes-no' =>[
                //Is Report Dispatched?, Signature?, NABL Scope ?, is_sample_condition, By Pass
                 'Yes' , 'No'
            ],
            'chemist' =>[
                 'Yes'
            ],
            'verified_by' => [
                'None', 'QA'
            ],
            'cancel' => [
                'None', 'Yes', 'No'
            ],
            'priority' => [
                'High', 'Medium', 'Low'
            ],
            'discipline' => [
                'Chemical', 'Biological'
            ],
            'booking_group' => [
                'Drugs and Pharmaceuticals', 'Food of Agriculture Product'
            ],
            'statement_of_conformity' => [
                'Pass', 'Intermediate', 'Fail'
            ],
            'sample_received_through' => [
                'By Courier', 'By Hand', 'By Collection'
            ],
            'parent_child' => [
                'Parent', 'Child'
            ],
        ]
    ]
?>
