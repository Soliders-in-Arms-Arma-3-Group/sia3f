# handlers

This module handles checking and then properly executing all of the different modules.  For example, it checks if ACE is enabled and then runs the ACE arsenal setup if it is and the vanilla arsenal setup if not.  This should always be the first module to be executed and the only one executed automatically (except *maybe* the ``configuration`` module).  Work in progress.
