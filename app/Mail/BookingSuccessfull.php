<?php

namespace App\Mail;

use App\Models\Booking;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class BookingSuccessfull extends Mailable
{
    use Queueable, SerializesModels;
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
     *You may wish for all e-mails sent by your application to be not sent from
     * the same address.
     * @return $this
     */
    public function build()
    {
        return $this->from(address:'pragnesh.divineinfosys@gmail.com',name:"ERP AUM REASEARCH")
                    ->subject(subject:"Booking Confirmation")
                    ->view('mail.booking-successfull',['mail_data'=>$this->booking_data]);
    }
}
