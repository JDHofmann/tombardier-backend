# Tombardier Backend

<br>

### *Portfolio Building Made Simple*

---

<br>

Tombardier is a browser based portfolio builder for developers to quickly build and deploy a personal site

Built with a Ruby on Rails API backend(this file), and a React/Redux front-end for Flatiron School Software Engineering Program

Check out the **[Live Demo](https://tombardier.netlify.app/)** to try it out.

<br>


**This repo is built to run as an API for it's companion [frontend](https://github.com/JDHofmann/tombardier-frontend) so I recommend setting that up once you have this repo working locally.**

<br>

---
---

## Getting Started

<br> 


Fork and clone this repo

Simply run 

`bundle install`

to install tombardier's backend.

<br>

There's not much more than that, to run Tombardier locally start up your rails server and go forth

`rails s`

<br>

---
---

<br>

### **Adding Cloud Storage**

<br>

Next let's get started with cloud storage. Our app works fine locally, but storing images locally won't work in production, so let's add cloud storage and ensure it works before moving to production. 

<br>

- *I have only gone through this process for AWS cloud storage, but there are tons of ways to do this, and possibly easier ways* 

<br>

Create an AWS account

Create a bucket

Create an IAM

<br>

**MAKE SURE YOU SAVE THESE CREDENTIALS SO YOU CAN ADD THEM TO YOUR RAILS PROJECT**

<br>

---

<br>

### **Adding Cloud Storage to your Rails Credentials** 

<br>

You'll need to add credentials from AWS, *or any cloud storage service*, to your rails app before deploying. 

<br>

To open and edit your credentails in VScode run

```EDITOR='code --wait' rails credentials:edit```

- if you using a different editor find your text editors command prompt and replace the word ***code*** in the command above with your specific prompt

<br>

You should see a file with this inside
``` 
    aws:
    access_key_id: 123
    secret_access_key: 345

    # Used as the base secret for all MessageVerifiers in Rails, including the one protecting cookies.

    secret_key_base: 3a6666666fef1bf8f18dad3bb609411a0f0ba1ddc1ce9e5a65d11ec089b6cc1f15ffd3cdd496f2cd3cb5a8051f4cdf29876ac65816a70f5a155e0798f86614aa
```

<br>

*If you don't see a file like that, ensure you used the correct command, or do some goggling, then message me nasty things, before you continue. The file you're opening should already be populated, if the file is empty Rails will not save your credentials*

<br>

Replace the **access_key_id** and **secret_access_key** values with your specific keys from your cloud account

<br>

Now open the ***Production.rb*** file inside your *config* folder

<br>

Comment out Line 32

`config.active_storage.service = :local`

and uncomment Line 35

`config.active_storage.service = :amazon`

<br>

Now open the ***Development.rb*** file inside your *config* folder

Comment out Line 29

`config.active_storage.service = :local`

and uncomment Line 32

`config.active_storage.service = :amazon`

<br>

This will set our environments to store our Active Storage Blobs in our new cloud storage setup.

<br>

---

<br>

---

<br>

**At this point I recommend setting up the [frontend](https://github.com/JDHofmann/tombardier-frontend) to ensure that everything works locally before moving onto production**

<br>

---

<br>

## Getting Tombardier Backend into Production

<br>

*So far, I have only deployed this app through Heroku and using AWS cloud storage, if you choose a different route and have success, please share with me and we can add further instructions to this README*

<br>


---

<br>

### **Using Heroku**

<br>

You'll need two things for this part, **A Heroku Account** and **The Heroku CLI**

<br>

- If you don't already have a heroku account, head to [heroku](www.heroku.com) to get started.

- If you don't already have the heorku **CLI** first [download](https://devcenter.heroku.com/articles/heroku-cli) and install the Heroku CLI.

<br>


Once you are setup with heroku, run

`heroku create`

`git push heroku main`

`heroku run rake db:migrate`

`heroku run rake db:seed`

<br>

Heroku should now be building out your application

<br>

---

<br>



### **Configure Heroku with our Rails Master Key**

<br>

Open the *master.key* file inside the *config* folder

Copy the contents of the file and run

`heroku config:set RAILS_MASTER_KEY=12345678`

replacing *12345678* with your rails master key

<br>

Everything should be good for your backend now, easier said than done, I know.

Run your heroku app and make sure you add ***/users/*** to the url, you should have a nice serialized json waiting for you there.

<br>

If everything works, *Congrats!* you've got the hard part, the frontend is way easier!

<br>

If not, comb through this readme again and double check your files, or just write me an email and describe where my explanation went wrong.

<br>
---
---

<br>

## Troubleshooting

<br>

If you run into trouble and need to reset the database, run

`heroku pg:reset DATABASE`

then run these commands once again

`heroku run rake db:migrate`

`heroku run rake db:seed`

<br>

**Some helpful article and videos**

https://pragmaticstudio.com/tutorials/using-active-storage-in-rails
