# Next.js Route Setup Script

This script helps you quickly set up a new route in your Next.js app. It verifies the presence of a Next.js environment, creates a new route folder under the `app` directory, and generates a basic React component within that folder.

## Prerequisites

- Ensure you are in a Next.js project root directory where `package.json` is located.
- Make sure `next` is listed as a dependency in `package.json`.

## Installation (Optional: Make the Script Globally Accessible)

To make this script accessible from anywhere on your system, you can move it to `/usr/bin`:

1. **Make the script executable**:
    ```bash
    chmod +x script.sh
    ```

2. **Move the script to `/usr/bin`**:
    ```bash
    sudo mv script.sh /usr/bin/route-init
    ```

    > Here, `route-init` is the name you’re assigning to the command. You can change it to any other name you prefer.

After this, you can run the script from anywhere with:
```bash
route-init <route_name> [file_extension]
```

## Usage

Run the script with the following command:

```bash
./script.sh <route_name> [file_extension]
```

Or, if you made it globally accessible:
```bash
route-init <route_name> [file_extension]
```

### Arguments

- `<route_name>` (required): The name of the route folder to be created inside the `app` directory.
- `[file_extension]` (optional): File extension for the component file (`tsx` by default). You can specify `js` if you prefer JavaScript.

### Examples

1. **Create a TypeScript route**:
    ```bash
    route-init about
    ```
   - This creates an `about` route in `app/about` with a `page.tsx` file.

2. **Create a JavaScript route**:
    ```bash
    route-init contact js
    ```
   - This creates a `contact` route in `app/contact` with a `page.js` file.

## Script Details

1. **Project Verification**:
   - Checks if `package.json` exists in the current directory.
   - Confirms `next` is listed as a dependency in `package.json` to verify it's a Next.js project.

2. **Route Creation**:
   - Ensures the specified folder name doesn't already exist in `app`.
   - Creates a new folder in `app/<route_name>` and a basic React component (`page.tsx` or `page.js`), with content based on the folder name.

## Example Output

If you run:

```bash
route-init blog
```

You'll see:

```
Setting up the blog route in your nextjs app
Setting up the route in app/blog
```

And the following structure will be created:

```
app/
└── blog/
    └── page.tsx
```

With `page.tsx` containing:

```javascript
import React from 'react';

const page = () => {
  return (
    <div>blog</div>
  );
};

export default page;
```

## Error Handling

- If `package.json` is not found or `next` is not listed as a dependency, the script exits with "This is not a nextjs app."
- If `<route_name>` is not provided, the script requests it.
- If the route already exists in `app`, the script exits with "Route already exists."

## Notes

- Ensure the script has executable permissions if not already set:
  ```bash
  chmod +x script.sh
  ```

## License

This project is open-source and available for personal and commercial use.