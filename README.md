The Gossip Project — Sinatra Edition
====================================

This repository contains a lightweight web application built with [Sinatra](https://sinatrarb.com) as part of The Hacking Project curriculum. The app lets you browse, create, and edit humorous “gossips” stored in a CSV file—perfect for practicing Ruby basics, HTTP routing, and templating.

Features
--------

- Browse every gossip on a stylized Bootstrap dashboard
- Create a new gossip through a simple form
- View individual gossips on their own page
- Edit existing gossips and persist changes back to the CSV store
- Dedicated health-check endpoint (`/`) for load balancers such as pfSense

Quick Start
-----------

1. Install Ruby 3.4 (RVM, rbenv, or your preferred manager).
2. Install dependencies:

   ```bash
   bundle install
   ```

3. Launch the app with Puma via Rack:

   ```bash
   rackup -p 4567
   ```

4. Open your browser at [http://127.0.0.1:4567](http://127.0.0.1:4567).

Project Structure
-----------------

```
.
├── config.ru            # Rack entrypoint
├── lib/
│   ├── controller.rb    # Sinatra routes
│   └── gossip.rb        # Gossip model backed by CSV
├── lib/views/           # ERB templates (index, show, new, edit)
└── db/gossip.csv        # Data store with fun sample entries
```

Development Tips
----------------

- Use `bundle exec rerun -- rackup -p 4567` for auto-reload while editing files (adjust patterns to ignore `db/` if needed).
- The CSV file keeps a header row (`Auteur,Potin`). If you edit it manually, preserve the header so `Gossip.all` keeps working.
- Every route with an `:id` segment expects a 1-based index matching the CSV order.

Testing the Flow
----------------

1. Visit `/` to see the list of gossips.
2. Click “Crée un nouveau potin !” to add a new entry.
3. Navigate to an individual gossip via its link (`/gossips/:id`).
4. Use the “modifier” link to update it (`/gossips/:id/edit`).

Keeping It Fun
--------------

The default data set holds private jokes and common THP mistakes (like typing `app/wiews`). Feel free to swap in your own anecdotes—just keep the CSV format intact.

License
-------

Educational use only. Have fun hacking and keep sharing the gossip!
