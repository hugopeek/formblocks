# FormBlocks introduction

Forms are often a bit of a hassle to create. Slightly different input fields each time, writing tedious HTML markup, typo's or little mistakes screwing up validation... I don't think anyone really likes building them.
Except end-users themselves, but they lack the proper tools to do this wi

## How to install FormBlocks

After installing the package, there’s a few extra things that need doing:

- Import the necessary ContentBlocks layouts & fields
- Adjust layout and field settings
- Set the ID’s of these new elements in FormBlocks system settings
- Create the chunks for the email template rows
- Create a container resource for all FormBlocks forms
- Create a collection grid for this container (optional)
- Create your first form and try it out!

## Dependencies

- FormIt
- getResources
- renderResources
- Twitter Bootstrap 3 (only for the front-end)