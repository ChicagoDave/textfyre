        /// <summary>
        /// Delete a record and commit the deletion to the database.
        /// </summary>
        public virtual void DeleteNow() {
            _recordset.IsDeleted = true;
            Save(CompositeSaveFlag.Delete);
        }

        public enum CompositeSaveFlag {
            Insert,
            Update,
            Delete
        }

        /// <summary>
        /// Save the current record to the database.
        /// </summary>
        public virtual int Save(CompositeSaveFlag compositeSaveFlag)
        {
            int ReturnValue = -1;
            
            if (_recordset.IsDeleted || compositeSaveFlag == CompositeSaveFlag.Delete) {
                ReturnValue = DataFactory.Delete#tableName#(#saveDeleteArgumentsNoType#);                
            } else {
                if (compositeSaveFlag == CompositeSaveFlag.Insert) {
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
