<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class BookingStatus extends Mailable
{
    use Queueable, SerializesModels;
    public $booking_data;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($data)
    {
        //
        $this->booking_data = $data;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from(address:'pragnesh.divineinfosys@gmail.com',name:"ERP AUM REASEARCH")
                    ->subject(subject:"Booking Tests Status Updation")
                    ->view('mail.booking-tests-status-updation',['mail_data'=>$this->booking_data]);
    }
}
