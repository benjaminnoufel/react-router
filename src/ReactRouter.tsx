import React, {FC as FunctionalComponent, LazyExoticComponent} from "react";
import {Route, RouteProps, Switch} from "react-router-dom";


interface IRouterItems extends RouteProps {}

interface IRouter {
    isConnectedRoutes: IRouterItems[];
    isDisconnectRoutes: IRouterItems[];
    globalRoutes: IRouterItems[];
    notFoundPage: LazyExoticComponent<FunctionalComponent>;
    isConnected: boolean;
}

const ReactRouter = ({isConnected, notFoundPage, isConnectedRoutes, globalRoutes, isDisconnectRoutes}: IRouter): JSX.Element => {
    if (isConnected) {
        return (
            <Switch>
                {[...isConnectedRoutes, ...globalRoutes].map((route: IRouterItems, key: number) => <Route key={key} exact={route.exact} path={route.path} component={route.component} />)};
                <Route component={notFoundPage} />
            </Switch>
        );
    }
    return (
        <Switch>
            {[...isDisconnectRoutes, ...globalRoutes].map((route: IRouterItems, key: number) => <Route key={key} exact={route.exact} path={route.path} component={route.component} />)};
            <Route component={notFoundPage} />
        </Switch>
    );
};

export default ReactRouter;
