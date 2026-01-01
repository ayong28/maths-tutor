import { type RouteConfig, route, index, layout } from "@react-router/dev/routes";

export default [
  layout("routes/root.tsx", [
    index("routes/home.tsx"),
    route(":category", "routes/category.tsx"),
    route(":category/:subcategory", "routes/worksheet.tsx"),
  ]),
] satisfies RouteConfig;