        /// <summary>
        /// Delete a record and commit the deletion to the database.
        /// </summary>
        public virtual void DeleteNow() {
            _recordset.IsDeleted = true;
            Save();
        }

        /// <summary>
        /// Overload for calling save without concern for the new primary key on insert.
        /// </summary>
        public virtual int Save() {
            #primaryKeyDataType# newPrimaryKey;
            return Save(out newPrimaryKey);
        }

        /// <summary>
        /// Save the current record to the database.
        /// </summary>
        public virtual int Save(out #primaryKeyDataType# newPrimaryKey)
        {
            int ReturnValue = -1;
            newPrimaryKey = #primaryKeyDefaultValue#;
            
            if (_recordset.IsDeleted) {
                ReturnValue = DataFactory.Delete#tableName#(#saveDeleteArgumentsNoType#);                
            } else {
                if (#saveIfTest#) {
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
