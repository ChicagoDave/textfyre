        /// <summary>
        /// Delete a record and commit the deletion to the database.
        /// </summary>
        public virtual void DeleteNow() {
            _recordset.IsDeleted = true;
            Save(SaveOperation.Delete);
        }

        public enum SaveOperation {
            Insert,
            Update,
            Delete
        }

        /// <summary>
        /// Save the current record to the database.
        /// </summary>
        public virtual int Save(SaveOperation saveOperation)
        {
            int ReturnValue = -1;
            
            if (_recordset.IsDeleted || saveOperation == SaveOperation.Delete) {
                ReturnValue = DataFactory.Delete#tableName#(#saveDeleteArgumentsNoType#);                
            } else {
                if (saveOperation == SaveOperation.Insert) {
                    #saveIfBody#                    
                } else {
                    if(_recordset.IsDirty) {    
                        ReturnValue = DataFactory.Update#tableName#(_recordset);                        
                    }
                }

                _recordset.IsDirty = false;
            }

            if (DataFactory.CacheManager != null) {
                string cacheKey = DataFactory.CacheManager.CreateCacheKey(TABLE_NAME, null);
                DataFactory.CacheManager.Remove2(cacheKey);
            }

            return ReturnValue;
        }
