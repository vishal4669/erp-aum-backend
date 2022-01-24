<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class WelcomeUserMail extends Mailable
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
        $this->user_data = $data;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from(address: 'pragnesh.divineinfosys@gmail.com', name: "ERP AUM REASEARCH")
            ->subject(subject: "Employee Registration Successfull.")
            ->view('mail.welcome-user', ['mail_data' => $this->user_data]);
    }
}
