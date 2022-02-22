import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Todo from 'App/Models/Todo';
import Env from '@ioc:Adonis/Core/Env'

import Stripe from '@ioc:Mezielabs/Stripe'

const stripe = require('stripe')(Env.get('STRIPE_SECRET_KEY') as string)

const accountSid = "AC4495374d9c9a6153f5c291a2cd3d95be";
const authToken = "2d2f156a508d744eedc115f111102680";
const client = require('twilio')(accountSid, authToken);

const MessagingResponse = require('twilio').twiml.MessagingResponse;
const VoiceResponse = require('twilio').twiml.VoiceResponse;

export default class TodosController {
  public async createTodo(ctx: HttpContextContract) {

    const data = ctx.request.all();

    return Todo.create(data);
  }
  public async deleteTodo(ctx: HttpContextContract) {

    const id = ctx.request.all().id;

    return Todo.query().where('id', id).delete().first();
  }

  public async getTodos() {

    return Todo.query().orderBy('id', 'desc');
  }
  public async sendSmsWithTwilo() {
    client.messages.create({
      body: 'Hello, Reply Again for testing please',
      to: '+8801303424199',
      from: '+18557111782'
    }).then(message => console.log(message))
      // here you can implement your fallback code
      .catch(error => console.log(error))
  }

  public async callWithTwilo() {
    const response = new VoiceResponse();
    response.say('Hello World');

    console.log(response.toString());
    client.calls.create({
      twiml: '<Response><Say>Hellloooooo!!! Come to online. I am waiting for you...</Say></Response>',
      // url: 'https://handler.twilio.com/twiml/EHb47f61076c61b73175a30192b12a52dd',
      to: '+8801303424199',
      from: '+18557111782'
    }).then(message => console.log(message))
      // here you can implement your fallback code
      .catch(error => console.log(error))
  }

  public async smsReply(req, res) {
    const twiml = new MessagingResponse();

    if (req.body.Body == 'hello') {
      twiml.message('Hi!');
    } else if (req.body.Body == 'bye') {
      twiml.message('Goodbye');
    } else {
      twiml.message(
        'No Body param match, Twilio sends this in the request to your server.'
      );
    }

    res.writeHead(200, { 'Content-Type': 'text/xml' });
    res.end(twiml.toString());

    // var requestBody = req.body.Body;
    // var requestForm = req.form.Form;

    // console.log("Joy");


    // console.log("req,body = "+req.body)
    // // console.log("req,body.body = "+req.body.Body)
    // // console.log("req,body.form = "+req.form.Form)

    console.log("Sms Reply Comes");
    // console.log(res);
    return "Done";
  }

  public async payment() {

    const paymentIntent = await Stripe.paymentIntents.create({
      payment_method_types: ["card"],
      receipt_email: 'biprobhowmik5@gmail.com',
      amount: 500,
      currency: 'usd',
    })

    return paymentIntent;

    //   stripe.customers.create({
    //     email: 'biprobhowmik5@gmail.com',
    //     source: 'req.body.stripeToken',
    //     name: 'Gautam Sharma',
    //     address: {
    //         line1: 'TC 9/4 Old MES colony',
    //         postal_code: '110092',
    //         city: 'New Delhi',
    //         state: 'Delhi',
    //         country: 'India',
    //     }
    // })
    // .then((customer) => {

    //     return stripe.charges.create({
    //         amount: 7000,    // Charing Rs 25
    //         description: 'Web Development Product',
    //         currency: 'USD',
    //         customer: customer.id
    //     });
    // })
    // .then((charge) => {
    //     res.send("Success") // If no error occurs
    // })
    // .catch((err) => {
    //     res.send(err)    // If some error occurs
    // });
  }
}
