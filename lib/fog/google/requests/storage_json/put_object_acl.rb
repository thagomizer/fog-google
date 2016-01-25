module Fog
  module Storage
    class GoogleJSON
      class Real
        # Change access control list for an Google Storage object
        # https://cloud.google.com/storage/docs/json_api/v1/objectAccessControls/insert
        #
        # ==== Parameters
        # * bucket_name<~String> - name of bucket object is in
        # * object_name<~String> - name of object to add ACL to
        # * acl<~Hash> - ACL hash to add to bucket, see GCS documentation above
        #    * entity
        #    * role
        def put_object_acl(bucket_name, object_name, acl)
          raise ArgumentError.new("bucket_name is required") unless bucket_name
          raise ArgumentError.new("object_name is required") unless object_name
          raise ArgumentError.new("acl is required") unless acl

          api_method = @storage_json.object_access_controls.insert
          parameters = {
            "bucket" => bucket_name,
            "object" => object_name
          }
          body_object = acl

          request(api_method, parameters, body_object = body_object)
        end
      end
    end
  end
end
