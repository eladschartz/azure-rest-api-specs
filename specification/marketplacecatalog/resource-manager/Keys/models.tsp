import "@typespec/rest";
import "@typespec/http";
import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";

using TypeSpec.Rest;
using TypeSpec.Http;
using Azure.ResourceManager;
using Azure.ResourceManager.Foundations;

namespace MicrosoftMarketplaceDiscoveryAPIKeysManagement;

interface Operations extends Azure.ResourceManager.Operations {}

/**
 * ApiKey object containing both the key and its alias.
 */
model ApiKey {
  /**
   * The API key alias.
   */
  keyAlias?: string;

  /**
   * The API key to be used when calling relevant Discovery endpoints.
   */
  key?: string;
}

/**
 * List of ApiKey objects.
 */
model ApiKeys is Azure.Core.Page<ApiKey>;
