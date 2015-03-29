dataSource {
    pooled = true
    jmxExport = true
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
            driverClassName = "com.mysql.jdbc.Driver"
            dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
            username = "jasonhei_code"
            password = "C0d34Go0d"
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:mysql://143.95.38.203/jasonhei_code4good?useUnicode=yes&characterEncoding=UTF-8"
            properties {
/** The maximum number of active connections that can be allocated from
 * this pool at the same time, or zero for no limit.
 * Make it '-1' to prevent performance problems with idle connections
 */
                maxActive = -1
/**
 * The maximum number of active connections that can remain idle in the
 * pool, without extra ones being released, or zero for no limit.
 */
                maxIdle = 8
/**
 * The minimum number of active connections that can remain idle in the
 * pool, without extra ones being created, or 0 to create none.
 */
                minIdle = 0
/**
 * The maximum number of milliseconds that the pool will wait (when there
 * are no available connections) for a connection to be returned before
 * throwing an exception, or -1 to wait indefinitely.
 */
                maxWait = 180000

                minEvictableIdleTimeMillis = 1000 * 60 * 15
                timeBetweenEvictionRunsMillis = 1000 * 60 * 15
                numTestsPerEvictionRun = 3

                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = false

                validationQuery = "select 1"
            }
        }

//        dataSource {
//            driverClassName = "com.mysql.jdbc.Driver"
//            dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
//            username = "code4good"
//            password = "C0d34Go0d"
//            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
//            url = "jdbc:mysql://localhost/code4good?useUnicode=yes&characterEncoding=UTF-8"
//        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
            properties {
               // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
               jmxEnabled = true
               initialSize = 5
               maxActive = 50
               minIdle = 5
               maxIdle = 25
               maxWait = 10000
               maxAge = 10 * 60000
               timeBetweenEvictionRunsMillis = 5000
               minEvictableIdleTimeMillis = 60000
               validationQuery = "SELECT 1"
               validationQueryTimeout = 3
               validationInterval = 15000
               testOnBorrow = true
               testWhileIdle = true
               testOnReturn = false
               jdbcInterceptors = "ConnectionState"
               defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
            }
        }
    }
}
