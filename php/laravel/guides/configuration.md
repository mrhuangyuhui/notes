# Configuration - Laravel - The PHP Framework For Web Artisans

<https://laravel.com/docs/7.x/configuration>

- All of the configuration files for the Laravel framework are stored in the `config` directory.

- <https://github.com/vlucas/phpdotenv>

- Your `.env` file should not be committed to your application's source control.

- You may also create a `.env.testing` file. This file will override the `.env` file when running PHPUnit tests or executing Artisan commands with the `--env=testing` option.

- Any variable in your `.env` file can be overridden by external environment variables such as server-level or system-level environment variables.

- All variables in your `.env` files are parsed as strings, so some reserved values have been created to allow you to return a wider range of types from the `env()` function.

- If you need to define an environment variable with a value that contains spaces, you may do so by enclosing the value in double quotes.

```
APP_NAME="My Application"
```

- All of the variables listed in this file will be loaded into the `$_ENV` PHP super-global when your application receives a request. However, you may use the `env` helper to retrieve values from these variables in your configuration files.

```
'debug' => env('APP_DEBUG', false),
```

- The current application environment is determined via the `APP_ENV` variable from your `.env` file. You may access this value via the environment method on the `App` facade:

```php
$environment = App::environment();
```

- You may also pass arguments to the environment method to check if the environment matches a given value. 

```php
if (App::environment('local')) {
    // The environment is local
}

if (App::environment(['local', 'staging'])) {
    // The environment is either local OR staging...
}
```

- The current application environment detection can be overridden by a server-level `APP_ENV` environment variable.

- You may easily access your configuration values using the global `config` helper function from anywhere in your application.

```php
$value = config('app.timezone');

// Retrieve a default value if the configuration value does not exist...
$value = config('app.timezone', 'Asia/Seoul');
```

- To set configuration values at runtime, pass an array to the `config` helper:

```php
config(['app.timezone' => 'America/Chicago']);
```

## API
