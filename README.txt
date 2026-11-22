LOOP setup

1. Upload these files to the root of your GitHub repository, replacing old app files:
   index.html, style.css, app.js, manifest.json, sw.js, icon.svg, supabase.sql

2. For user accounts and cloud sync:
   - Create a project at https://supabase.com
   - In Supabase, open SQL Editor and run the contents of supabase.sql.
   - In Project Settings > API, copy Project URL and anon/public key.
   - In app.js, replace YOUR_SUPABASE_URL and YOUR_SUPABASE_ANON_KEY with those values.
   - Save and commit app.js to GitHub. Cloudflare Pages should redeploy.

3. Offline/install:
   - Open the site in Chrome while online once.
   - Use Chrome menu > Install app or Add to Home screen.
   - The shell is cached for offline use. Tasks are saved in local storage.
   - Cloud sync/account sign-in requires internet. Tasks added offline are stored locally and attempt sync next time online.

4. Important:
   - Supabase anon key is intended for client apps; never put service-role keys in app.js.
   - Keep RLS policies enabled.
   - Browser speech voice availability depends on Android/browser voices. It may not speak in the background after the app is closed.
