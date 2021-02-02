# react-router

This a React Router componant for initialize a router.

![Code Style CI](https://github.com/benjaminnoufel/react-router/workflows/Code%20Style%20CI/badge.svg)
![Package](https://github.com/benjaminnoufel/react-router/workflows/Package/badge.svg)
![Package npmjs](https://github.com/benjaminnoufel/react-router/workflows/Package%20npmjs/badge.svg)

## Requirements

- [Node](node)
- [NPM][npm] or [Yarn][yarn]

## Installation

### [NPM][npm]

```console
$ npm install --save @benjaminnoufel/react-router
```

### [Yarn][yarn]

```console
$ yarn add @benjaminnoufel/react-router
```

## Environment setup

```console
$ cp .env.example .env
$ $EDITOR .env
```

Where `$EDITOR` is your favorite text editor's command line interface.

## Usage

### Use ReactRouter with only connected routes
```tsx
import ReactRouter from "@benjaminnoufel/react-router"
import React, {FC as FunctionalComponent, LazyExoticComponent, lazy} from "react";

const App = () => {
    const HomePage: LazyExoticComponent<FunctionalComponent> = lazy(() => import("@Pages/HomePage"));
    const Logout: LazyExoticComponent<FunctionalComponent> = lazy(() => import("@Pages/Logout"));
    const NotFoundPage: LazyExoticComponent<FunctionalComponent> = lazy(() => import("@Pages/404"));

    const isConnectedRoutes = [
        {
            exact: true,
            path: "/home",
            component: HomePage
        },
        {
            exact: true,
            path: "/logout",
            component: Logout
        }
    ];


    return (
        <>
            <ReactRouter
                isConnectedRoutes={isConnectedRoutes}
                isDisconnectRoutes={[]}
                globalRoutes={[]}
                notFoundPage={NotFoundPage}
                isConnected={true}

            />
        </>
    );   
}

```

### Use ReactRouter with connected, disconnected and global routes
```tsx
import ReactRouter from "@benjaminnoufel/react-router"
import React, {FC as FunctionalComponent, LazyExoticComponent, lazy} from "react";

const App = () => {
    const HomePage: LazyExoticComponent<FunctionalComponent> = lazy(() => import("@Pages/HomePage"));
    const Logout: LazyExoticComponent<FunctionalComponent> = lazy(() => import("@Pages/Logout"));
    const Login: LazyExoticComponent<FunctionalComponent> = lazy(() => import("@Pages/Login"));
    const Information: LazyExoticComponent<FunctionalComponent> = lazy(() => import("@Pages/Information"));

    const isConnectedRoutes = [
        {
            exact: true,
            path: "/home",
            component: HomePage
        },
        {
            exact: true,
            path: "/logout",
            component: Logout
        }
    ];

    const isDisconnectRoutes = [
        {
            exact: true,
            path: "/login",
            component: Login
        }
    ];

    const globalRoutes = [
        {
            exact: true,
            path: "/",
            component: Information
        }
    ];

    return (
        <>
            <ReactRouter
                isConnectedRoutes={isConnectedRoutes}
                isDisconnectRoutes={isDisconnectRoutes}
                globalRoutes={globalRoutes}
                notFoundPage={NotFoundPage}
                isConnected={true}
            />
        </>
    );   
}

```

### API

```ts
import {RouteProps} from "react-router-dom";
interface IRouterItems extends RouteProps {}

interface IRouter {
    isConnectedRoutes: IRouterItems[];
    isDisconnectRoutes: IRouterItems[];
    globalRoutes: IRouterItems[];
    notFoundPage: LazyExoticComponent<FunctionalComponent>;
    isConnected: boolean;
}
```


[npm]: https://www.npmjs.com/
[yarn]: https://yarnpkg.com/
