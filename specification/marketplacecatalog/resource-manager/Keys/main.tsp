import "@typespec/rest";
import "@typespec/versioning";
import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";
import "./models.tsp";
import "./routes.tsp";

using TypeSpec.Rest;
using TypeSpec.Http;
using Azure.ResourceManager.Foundations;
using Azure.Core;
using Azure.ResourceManager;
using TypeSpec.Versioning;
/**
 * This API is designed to streamline the process of generating designated keys for accessing all Marketplace Catalog APIs. By utilizing a simple POST operation, users can effortlessly generate a unique API key, granting  access to Marketplace Catalog APIs from version 2023-01-01 and beyond.
 */
@armProviderNamespace
@service({
  title: "Microsoft Marketplace Discovery API Keys Management",
})
@versioned(Versions)
@armCommonTypesVersion(Azure.ResourceManager.CommonTypes.Versions.v5)
namespace MicrosoftMarketplaceDiscoveryAPIKeysManagement;

/**
 * The available API versions.
 */
enum Versions {
  /**
   * The 2023-01-01-preview API version.
   */
  @useDependency(Azure.ResourceManager.Versions.v1_0_Preview_1)
  @useDependency(Azure.Core.Versions.v1_0_Preview_1)
  v2023_01_01_preview: "2023-01-01-preview",
}
