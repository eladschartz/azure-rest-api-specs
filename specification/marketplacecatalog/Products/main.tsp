import "@typespec/rest";
import "@typespec/versioning";
import "@azure-tools/typespec-azure-core";

using Http;
using Rest;
using Versioning;
using Azure.Core;

@service(#{ title: "Products" })
@server("https://catalogapi.azure.com", "The base URL for the Products API.")
namespace Products;

enum Versions {
  @useDependency(Azure.Core.Versions.v1_0_Preview_2)
  v2023_02_01_preview: "2023-02-01-preview",
}

@resource("ProductSummary")
@doc("A summary of a product.")
model ProductSummary {
  @key("ProductSummary")
  @doc("The unique identifier for the product.")
  id: string;

  @doc("Some other description of the product.")
  legacyId: string;
}

@resource("PlanSummary")
@parentResource(ProductSummary)
@doc("A summary of a plan.")
model PlanSummary {
  @key("planId")
  @doc("The unique identifier for the plan.")
  id: string;

  @doc("Some other description of the plan.")
  legacyId: string;
}

@route("/products")
namespace Products {
  @get
  op listProducts(): {
    @statusCode statusCode: 200;
  };
}
