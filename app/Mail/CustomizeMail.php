<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class CustomizeMail extends Mailable
{
    use Queueable, SerializesModels;
    public $content, $subject;

    public function __construct($content)
    {
        $this->content = $content;
        $this->subject = $content['subject'];
    }

    public function build()
    {
        return $this->view('mail.customize')
            ->subject($this->subject)
            ->with('content', $this->content);
    }
}
